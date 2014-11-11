class RegionsController < ApplicationController
  before_action :check_admin, only: [:new, :create]

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    @region.save

    redirect_to @region
  end

  def show
    @region = Region.find(params[:id])
    @categories = Category.all
  end

  def index
    @regions = Region.all
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
