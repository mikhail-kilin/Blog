class RatingsController < ApplicationController
  expose :rating
  before_action :authenticate_user!
  expose_decorated :article
  expose :rating, build: ->(rating_params) { Rating.new(rating_params) }

  def create
    redirect_to article_path(article) unless rating.save
  end

  def update
    redirect_to article_path(article) unless rating.update rating_params
  end

  private

  def rating_params
    {
      user: current_user,
      article_id: params[:article_id],
      rate: params[:rating][:rate]
    }
  end
end
