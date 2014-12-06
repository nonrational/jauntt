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
    result = message.text
    filters.each_with_index do |f, idx|
      filter = Filters.const_get(f).new
      result = filter.apply(result)
      intermediate_result = {
        sender_id: message.sender.id,
        message: result,
        filter_name: f,
        last: idx == filters.size - 1
      }
      client.publish(channel: message.room.id, message: intermediate_result)
    end
  end

  handle_asynchronously :process

  private

  def client
    @client ||= Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
  end
end
