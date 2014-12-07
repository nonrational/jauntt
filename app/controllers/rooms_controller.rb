class RoomsController < ApplicationController
  def create
    redirect_to Room.create!
  end

  def show
    @room = Room.find(params[:id])
    @room.room_presences.find_or_create_by(member: current_user).touch
    @message = @room.build_message(sender: current_user)
  end
end
