class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :allow_iframe_requests

  private

  def current_user
    @current_user ||= User.find_by id: cookies.permanent.signed[:user_id]
    @current_user ||= User.create!
    cookies.permanent.signed[:user_id] = @current_user.id
    @current_user
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
