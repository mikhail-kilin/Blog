class CreateCompanyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_users do |t|
      t.integer "company_id"
      t.integer "user_id"
      t.string "role", null: false, default: "owner"

      t.timestamps
    end
  end
end
