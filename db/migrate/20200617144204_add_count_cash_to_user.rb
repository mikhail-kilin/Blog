class AddCountCashToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :articles_count, :integer, null: false, default: 0
    add_column :users, :comments_count, :integer, null: false, default: 0
  end
end
