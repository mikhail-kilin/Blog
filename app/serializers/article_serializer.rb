class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :company_id, :created_at
end
