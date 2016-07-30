class ReviewsController < ApplicationController

before_filter :authorize, :only => [:edit, :delete]

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

 private

  def review_params
   params.require(:review).permit(:rating, :description)
  end
end
