class Message
  include ActiveModel::Model
  attr_accessor :sender, :text, :room

  validates :text, presence: true

  def id
    @id ||= SecureRandom.uuid
  end

  def submit
    MessagePublisher.new(self).publish
  end
end
