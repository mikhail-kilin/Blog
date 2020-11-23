require "rails_helper"

feature "Create Article" do
  background do
    FactoryBot.create :user
  end

  scenario "Visitor tries to create new article" do
    visit new_admin_scope_article_path
    expect(page).to have_content "You need to sign in"
  end
end
