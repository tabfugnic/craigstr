class RegionsController < ApplicationController
  before_action :check_admin

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    @region.save

    redirect_to @region
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
