class Message
  include ActiveModel::Model
  attr_accessor :sender, :text, :room

  validates :text, presence: true

  def id
    @id ||= SecureRandom.uuid
  end

  def process
    FilterChain.new(self).add_random(5).process
  end
end
