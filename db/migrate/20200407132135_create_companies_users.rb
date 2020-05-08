class CreateCompaniesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :companies_users, id: false do |t|
      t.integer "company_id"
      t.integer "author_id"
    end

    add_index :companies_users, :company_id
    add_index :companies_users, :author_id
  end
end
