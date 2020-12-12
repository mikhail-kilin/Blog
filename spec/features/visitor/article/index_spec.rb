require "rails_helper"

feature "View Articles" do
  let(:user) { create :user }
  let(:company) { create :company, owner: user }
  let!(:last_article) { create :article, :published, :company, user: user, company: company }
  let!(:draft_article) { create :article, :draft, :company, user: user, company: company }
  let(:first_title) { Article.order(created_at: :desc).first.title }
  let(:last_title) { last_article.title }

  background do
    create_list :article, 20, :published, :company, user: user, company: company
    visit company_path(company)
  end

  scenario "Visitor can see sorted paginated articles" do
    expect(page).to have_content(first_title)
    expect(page).not_to have_content(last_title)
    expect(page).not_to have_content(draft_article.title)

    click_on "Last »"

    expect(page).not_to have_content(first_title)
    expect(page).to have_content(last_title)
    expect(page).not_to have_content(draft_article.title)
  end
end
