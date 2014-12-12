class MessagePublisher

  attr_reader :message

  delegate :room, :sender, to: :message

  def initialize(message)
    @message = message
  end

  def publish
    translations = translate_for_room
    _publish({
      message_id: message.id,
      sender_name: sender.name,
      sender_id: sender.id,
      source_language: sender.language,
      original_text: message.text,
      message: translations
    })
  end

  def translate_for_room
    room.member_languages.each_with_object({}) do |l, memo|
      memo[l] = Translator.new(sender.language, l).translate(message.text)
    end
  end

  private

  def _publish(payload)
    client.publish(channel: room.id, message: payload) do |r|
      puts "published message #{r.inspect}"
    end
  end

  def client
    @client ||= Pubnub.new(:subscribe_key => "sub-c-758a8ca2-824f-11e4-8e7a-02ee2ddab7fe", :publish_key => "pub-c-61366627-4469-4726-8061-4d1f3ce606a9")
  end
end
