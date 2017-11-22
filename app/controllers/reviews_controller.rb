class ReviewsController < ApplicationController



def create
  @review = Review.new(review_params)
  @review.restaurant = Restaurant.find(params[:restaurant_id])
  @restaurant  = @review.restaurant

  if @review.save
    redirect_to @restaurant
  else
    render "restaurants/show"
  end
end


private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
