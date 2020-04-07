class CreateCompanyRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :company_roles do |t|
      t.integer "company_id"
      t.integer "user_id"
      t.string "role"

      t.timestamps
    end
  end
end
