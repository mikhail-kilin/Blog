class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :article_id
      t.integer :user_id
      t.integer :rate
    end
  end
end
