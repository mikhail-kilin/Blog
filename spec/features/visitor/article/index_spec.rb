require "rails_helper"

feature "View Articles" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }
  let(:draft) { FactoryBot.create :article, :draft, :company, user: user, company: company }

  background do
    FactoryBot.create_list :article, 6, :published, :company, user: user, company: company
    FactoryBot.create :user
    visit company_path(company)
  end

  scenario "Visitor can see sorted paginated articles" do
    first_title = Article.order(created_at: :desc).first.title
    last_title = Article.order(created_at: :desc).last.title

    expect(page).to have_content(first_title)
    expect(page).not_to have_content(last_title)

    click_on "Last »"

    expect(page).not_to have_content(first_title)
    expect(page).to have_content(last_title)
  end

  scenario "Visitor can see only published articles" do
    expect(page).not_to have_content(draft.title)
  end

  scenario "Visitor can see search articles by title" do
    article = Article.order(created_at: :desc).last

    expect(page).not_to have_content(article.title)

    first_title_word = article.title.split(" ").last

    fill_in :search_data, with: first_title_word

    click_on "Search"

    expect(page).to have_content(article.title)
  end

  scenario "Visitor can see search articles by title" do
    article = Article.order(created_at: :desc).last
    expect(page).not_to have_content(article.title)

    first_content_word = article.content.split(" ").last

    fill_in :search_data, with: first_content_word

    click_on "Search"

    expect(page).to have_content(article.title)
  end
end
