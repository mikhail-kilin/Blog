module V1
  class ArticlesController < ApplicationController
    expose :article

    def_param_group :comment do
      param :id, :number, desc: "Comment id"
      param :content, String, desc: "Text of comment"
      param :user_id, :number, desc: "Id of owner"
      param :created_at, String, desc: "Time of creation"
    end

    api :GET, "/v1/articles/:id/comments"
    param :id, :number, desc: "id of article"
    returns array_of: :comment, code: 200, desc: "All comments of this article"
    def comments
      render json: article.comments
    end
  end
end
