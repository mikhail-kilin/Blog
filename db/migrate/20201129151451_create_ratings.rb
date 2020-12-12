class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :article, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :rate, default: 0, null: false
    end

    add_index :ratings, [:article_id, :user_id], unique: true
  end
end
