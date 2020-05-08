require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in"
  let!(:company) { FactoryBot.create :company, owner: User.first }
  let!(:article) { FactoryBot.create :article, :company, user: User.first, company: company }

  background do
    visit article_path(article)
  end

  scenario "Admin enters valid data" do
    text = "text"

    fill_in :comment_content, with: text
    click_on "Submit"

    expect(page).to have_content(text)
  end
end
