class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    values = params[:review]
    review = Review.new do |r|
      r.user = current_user
      r.product_id = params[:product_id]
      r.description = values[:description]
      r.rating = values[:rating]
    end

    if review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Thank you!'
    else
      @product = Product.find(params[:product_id])
      @review = Review.new
      redirect_to "/products/#{params[:product_id]}", error: review.errors.full_messages.first
    end
  end

  def destroy
    @reviewed = Review.find params[:id]
    @reviewed.destroy
    redirect_to "/products/#{params[:product_id]}", notice: 'Review has been deleted!'
  end

end
