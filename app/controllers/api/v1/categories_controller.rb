class Api::V1::CategoriesController < ApplicationController

  # before_action :authenticate_user!, only: [:create]
  # before_action :authenticate_user!
  before_action :load_category, only: [:show]

  def index
    @categories = Category.all
    render json: {
      messages: "Category list loaded",
      is_success: true,
      data: {categories: @categories}
    }, status: :ok
  end

  def show
    @technologies = @category.technologies
    render json: {
      messages: "Category loaded",
      is_success: true,
      data: {category: @category, technologies: @technologies}
    }, status: :ok
  end

  private
  def category_params
    params.require(:category).permit :id
  end

  def load_category
    @category = Category.find(params[:id])
    if @category
      return @category
    else
      render json: {
        messages: "Cannot get Category",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end

end
