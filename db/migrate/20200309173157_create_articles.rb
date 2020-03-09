class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :status, null: false, default: "draft"

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :content
    add_index :articles, :status
  end
end
