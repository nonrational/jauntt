class Room < ActiveRecord::Base
  has_many :room_presences
  has_many :active_room_presences, -> { where("room_presences.updated_at > ?", 2.minutes.ago) }, class_name: 'RoomPresence'
  has_many :members, through: :active_room_presences

  def build_message(opts = {})
    Message.new opts.merge(room: self)
  end
end
