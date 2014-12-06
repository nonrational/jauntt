class RoomsController < ApplicationController
  def create
    redirect_to Room.create!
  end

  def show
    @room = Room.find(params[:id])
  end
end
