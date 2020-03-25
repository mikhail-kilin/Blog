class StaticPagesController < ApplicationController
  before_action :set_static_page, only: :show

  def show
  end

  private

  def set_static_page
    @static_page = StaticPage.find(params[:id])
    @static_page_policy = StaticPagePolicy.new current_user
  end
end
