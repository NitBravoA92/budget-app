class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @categories = current_user.categories.includes([icon_attachment: :blob])
  end
end
