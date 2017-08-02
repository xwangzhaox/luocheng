class CategoriesController < ApplicationController
  layout "category"

  def show
    @category = Category.where(en_name: params[:en_name]).first
  end
end
