class CategoriesController < ApplicationController
  before_action :check_authorization, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save

    redirect_to @category
  end

  def show
    @category = find_category
  end

  def edit
    @category = find_category
  end

  def update
    @category = find_category
    @category.update(category_params)

    redirect_to @category
  end

  def destroy
    @category = find_category
    @category.delete

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category
    Category.find(params[:id])
  end

  def check_authorization
    raise User::NotAuthorized unless current_user.admin?
  end
end
