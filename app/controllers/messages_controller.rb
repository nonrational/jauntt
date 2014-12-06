class MessagesController < ApplicationController
  def create
    @room = Room.find params[:room_id]
    default_params = { sender: current_user }
    @message = @room.build_message(default_params.merge(create_params))
    @message.send
    head :no_content
  end

  private

  def create_params
    params.require(:message).permit(:text)
  end
end
