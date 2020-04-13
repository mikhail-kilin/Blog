require "rails_helper"

feature "View Articles" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }
  let(:draft) { FactoryBot.create :article, :draft, :company, user: user, company: company }

  background do
    FactoryBot.create_list :article, 20, :published, :company, user: user, company: company
    FactoryBot.create :user
    visit articles_path
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
end
