class RoomPresence < ActiveRecord::Base
  TIMEOUT = 10.seconds
  belongs_to :room
  belongs_to :member, class_name: 'User'

  scope :active, -> { where("room_presences.updated_at > ?", TIMEOUT.ago) }
end
