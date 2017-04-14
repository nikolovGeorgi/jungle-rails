class CategoriesController < ApplicationController

  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @product = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
