class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.car
	end

	def destroy
		@review = Review.find(params[:id])
		car = @review.car
		@review.destroy

		redirect_to car
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :car_id)
		end
end