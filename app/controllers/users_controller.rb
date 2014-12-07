class UsersController < ApplicationController
  def update
    current_user.update update_params
    render 'update'
  end

  private

  def update_params
    params.require(:user).permit(:name, :language)
  end
end
