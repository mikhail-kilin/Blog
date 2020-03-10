require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"

  background do
    article = FactoryBot.create :article
    visit edit_article_path(article)
  end

  scenario "Admin enters valid data" do
    new_title = "new_title"
    new_content = "new_content"

    fill_form(:article, :new, title: new_title, content: new_content)
    click_on "Submit"

    expect(page).to have_content(new_title)
    expect(page).to have_content(new_content)
  end
end
