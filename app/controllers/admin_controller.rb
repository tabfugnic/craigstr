class AdminController < ApplicationController
  before_action :check_authorization

  def show
  end

  private

  def check_authorization
    raise User::NotAuthorized unless current_user.admin?
  end
end
