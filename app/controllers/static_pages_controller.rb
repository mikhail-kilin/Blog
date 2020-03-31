class StaticPagesController < ApplicationController
  expose :static_page, find_by: :slug

  def show
  end
end
