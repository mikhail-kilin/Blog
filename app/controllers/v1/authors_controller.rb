module V1
  class AuthorsController < ApplicationController
    expose :user

    def_param_group :article do
      param :id, :number, desc: "Article id"
      param :title, String, desc: "Title of article"
      param :content, String, desc: "Text of article"
      param :user_id, :number, desc: "Id of owner"
      param :company_id, :number, desc: "Id of company"
      param :created_at, String, desc: "Time of creation"
    end

    api :GET, "/v1/authors/:id/articles"
    param :id, :number, desc: "id of author (user)"
    returns array_of: :article, code: 200, desc: "All articles of this author"
    def articles
      render json: user.articles
    end
  end
end
