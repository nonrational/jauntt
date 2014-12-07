class Room < ActiveRecord::Base
  has_many :room_presences
  has_many :active_room_presences, -> { merge(RoomPresence.active) }, class_name: 'RoomPresence'
  has_many :members, through: :active_room_presences

  def build_message(opts = {})
    Message.new opts.merge(room: self)
  end
end
