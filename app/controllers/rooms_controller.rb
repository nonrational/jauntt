class RoomsController < ApplicationController
  def create
    redirect_to Room.create!
  end
end
