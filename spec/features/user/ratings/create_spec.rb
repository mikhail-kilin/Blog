require "rails_helper"

feature "Create Rating" do
  include_context "current user signed in"
  let(:company) { create :company, owner: current_user }
  let(:article) { create :article, :company, user: current_user, company: company }
  let(:another_user) { create :user }
  let!(:rating) { create :rating, user: another_user, article: article, rate: 5 }

  background do
    visit article_path(article)
  end

  scenario "User choose 1 point", js: true do
    expect(page).to have_content("5.0/5")
    star = find(:xpath, "//i[1]")
    star.click
    expect(page).to have_content("3.0/5")
  end
end
