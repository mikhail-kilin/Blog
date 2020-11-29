class AddWeekCommentsCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :week_comments_count, :integer, null: false, default: 0
  end
end
