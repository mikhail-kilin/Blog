require "rails_helper"

feature "Get Comments" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }

  background do
    company.authors = FactoryBot.create_list :user, 2
    visit authors_v1_company_path(company.id)
  end

  scenario "I can get comments of article" do
    User.all.each do |item|
      expect(page).to have_content(item.full_name)
    end
  end
end
