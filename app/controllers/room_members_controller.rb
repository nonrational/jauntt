class RoomMembersController < ApplicationController
  def index
    @room = Room.find params[:room_id]
    @room.room_presences.find_or_create_by(member: current_user).touch
  end
end
