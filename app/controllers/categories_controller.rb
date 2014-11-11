class CategoriesController < ApplicationController
  before_action :check_admin, except: :show

  def new
    @region = Region.find(params[:region_id])
    @category = Category.new
  end

  def create
    @region = Region.find(params[:region_id])
    @category = Category.new(category_params)
    @category.save

    redirect_to [@region, @category]
  end

  def show
    @region = Region.find(params[:region_id])
    @category = find_category
  end

  def edit
    @region = Region.find(params[:region_id])
    @category = find_category
  end

  def update
    @region = Region.find(params[:region_id])
    @category = find_category
    @category.update(category_params)

    redirect_to [@region, @category]
  end

  def destroy
    @region = Region.find(params[:region_id])
    @category = find_category
    @category.delete

    redirect_to @region
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category
    Category.find(params[:id])
  end
end
