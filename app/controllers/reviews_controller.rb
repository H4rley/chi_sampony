# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    respond_to do |format|
      if @review.save
        format.js { render 'reviews/show_updated_view', status: 200 }
      else
        format.js { render 'reviews/show_updated_view', status: 400 }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:text, :rating, :product_id, :user_id)
  end
end
