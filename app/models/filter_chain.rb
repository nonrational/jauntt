require 'filters'

class FilterChain
  attr_reader :message, :filters

  def initialize(message)
    @message = message
    @filters = []
  end

  def add_random(num = 5)
    @filters += Filters.constants.shuffle.take(num)
    self
  end

  def process
    puts "PROCESSING message #{message.inspect}"

    result = message.text
    filters.each do |f|
      puts "STARTING filter #{f} for message #{message.inspect}"

      publish({
        type: 'before_filter',
        message: result,
        filter: f
      })

      filter = Filters.const_get(f).new
      result = filter.apply(result)

      puts "FINISHED filter #{f} for message #{message.inspect}"
    end

    publish({
      type: 'after_process',
      message: result
    })

    puts "PROCESSING COMPLETE message #{message.inspect}"
  end

  handle_asynchronously :process

  private

  def publish(payload = {})
    final_payload = payload.merge({ id: SecureRandom.uuid, message_id: message.id, sender_id: message.sender.id })
    client.publish(channel: message.room.id, message: final_payload) do |r|
      puts "published message #{r.inspect}"
    end
    sleep 1
  end

  def client
    @client ||= Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
  end
end
