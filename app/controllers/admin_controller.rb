class AdminController < ApplicationController
  before_action :check_authorization

  def show
  end

  private

  def check_authorization
    render :status => 401
  end
end
