require "rails_helper"

feature "Update Rating" do
  include_context "current user signed in"
  let!(:rating) { create :rating, user: current_user, article: article, rate: 4 }
  let(:company) { create :company, owner: current_user }
  let(:article) { create :article, :company, user: current_user, company: company }

  background do
    visit article_path(article)
  end

  scenario "User choose 3 points", js: true do
    expect(page).to have_content("4.0/5")
    find(:xpath, "//i[3]").click
    expect(page).to have_content("3.0/5")
  end
end
