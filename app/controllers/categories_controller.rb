class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create]
  def index
    @categories = current_user.categories.includes([icon_attachment: :blob])
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
