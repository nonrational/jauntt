class UsersController < ApplicationController
  def update
    current_user.name = update_params[:name]
    current_user.save!
    render 'update'
  end

  private

  def update_params
    params.require(:user).permit(:name)
  end
end
