class UpdateArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :integer
    add_column :articles, :company_id, :integer
  end
end
