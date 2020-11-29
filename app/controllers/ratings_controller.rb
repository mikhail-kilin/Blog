class RatingsController < ApplicationController
  expose :rating
  expose_decorated :article, -> { rating.article }
  before_action -> { authorize rating }

  def create
    rating.save
  end

  def update
    rating.update rating_params
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :user_id, :article_id)
  end
end
