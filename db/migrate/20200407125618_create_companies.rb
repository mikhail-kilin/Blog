class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string "name"
      t.string "image"
      t.string "slug"
      t.integer "owner_id"

      t.timestamps
    end

    add_index :companies, :slug, unique: true
  end
end
