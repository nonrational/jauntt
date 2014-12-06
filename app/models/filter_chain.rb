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
    publish({
      message: message.text,
      last: false
    })
    result = message.text
    filters.each_with_index do |f, idx|
      publish({
        message: message.text,
        filter: f,
        last: false
      })

      filter = Filters.const_get(f).new
      result = filter.apply(result)

      publish({
        message: result,
        filter_name: f,
        last: idx == filters.size - 1
      })
    end
  end

  handle_asynchronously :process

  private

  def publish(payload = {})
    final_payload = payload.merge({ sender_id: message.sender.id })
    client.publish(channel: message.room.id, message: final_payload) do |r|
      puts "published message #{r.inspect}"
    end
  end

  def client
    @client ||= Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
  end
end
