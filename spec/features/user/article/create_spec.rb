require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"

  background do
    visit new_article_path
  end

  scenario "Admin enters valid data" do
    title = "title"
    content = "content"

    fill_form(:article, :new, title: title, content: content)
    click_on "Submit"

    expect(page).to have_content(title)
    expect(page).to have_content(content)
  end
end
