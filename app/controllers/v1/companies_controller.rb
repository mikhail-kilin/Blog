module V1
  class CompaniesController < ApplicationController
    expose :company

    def_param_group :user do
    end

    def_param_group :response do
      param :owner, Hash do
        param :id, :number, desc: "Owner id"
        param :full_name, String, desc: "Owner Name"
        param :email, String, desc: "Owner email"
        param :created_at, String, desc: "Time of creation of Owner"
      end
      param :authors, Array do
        param :id, :number, desc: "Owner id"
        param :full_name, String, desc: "Owner Name"
        param :email, String, desc: "Owner email"
        param :created_at, String, desc: "Time of creation of Owner"
      end
    end

    api :GET, "/v1/companies/:id/authors"
    param :id, :number, desc: "id of company"
    returns array_of: :response, code: 200, desc: "Company owner and all authors(users) of this company"
    def authors
      render json: company
    end
  end
end
