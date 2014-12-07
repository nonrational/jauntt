class MessagesController < ApplicationController
  def create
    @room = Room.find params[:room_id]
    @message = @room.build_message(default_create_params.merge(create_params))
    if @message.valid?
      @message.submit
      @message = @room.build_message default_create_params
      render 'messages/create'
    else
      render 'messages/create'
    end
  end

  private

  def default_create_params
    { sender: current_user }
  end

  def create_params
    params.require(:message).permit(:text)
  end
end
