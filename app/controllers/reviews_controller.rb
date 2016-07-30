class ReviewsController < ApplicationController

before_filter :authorize, :only => [ :delete]

  def create
    @product = Product.find params[:product_id]
    @review =Review.new(review_params)
    @user = current_user
    @review.user = current_user
    @review.product = @product

    if @review.save!
     redirect_to [@product]
    else
     redirect_to [@product]
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to [@product], notice: 'Category deleted!'
  end


 private

  def review_params
   params.require(:review).permit(:rating, :description, :product_id)
  end
end
