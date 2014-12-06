class Message
  include ActiveModel::Model

  attr_accessor :sender, :text, :room

  def send
    FilterChain.new(self).add_random(5).process
  end
  #handle_asynchronously :send
end
