class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  def current_user
    super || Guest.new
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_admin
    raise User::NotAuthorized unless current_user.admin?
  end
end
