class RoomsController < ApplicationController
  def create
    redirect_to Room.create!
  end

  def show
    @room = Room.find(params[:id])
    @message = @room.build_message(sender: current_user)
  end
end
