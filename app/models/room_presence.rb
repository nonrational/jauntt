class RoomPresence < ActiveRecord::Base
  belongs_to :room
  belongs_to :member, class_name: 'User'
end
