class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by id: cookies.permanent.signed[:user_id]
    @current_user ||= User.create! language: language
    cookies.permanent.signed[:user_id] = @current_user.id
    @current_user
  end

  def language
    request.headers['Accept-Language'].split(',')[1].split('').take(2).join('')
  end
end
