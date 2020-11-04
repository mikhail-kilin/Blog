require "rails_helper"

feature "Reports" do
  include_context "current user signed in"

  let!(:company) { FactoryBot.create :company, owner: current_user }
  let(:commentator) { FactoryBot.create :user }
  let(:author) { FactoryBot.create :user }
  let(:beginner) { FactoryBot.create :user }
  let(:expert) { FactoryBot.create :user }

  background do
    add_company commentator
    add_company author
    add_company beginner
    add_company expert
    FactoryBot.create :article, :company, company: company, user: author
    article = FactoryBot.create :article, :company, company: company, user: expert
    FactoryBot.create :comment, article: article, user: commentator
    FactoryBot.create :comment, article: article, user: expert
    visit admin_scope_reports_path
  end

  scenario "Admin can see all authors" do
    expect(page).to have_content(commentator.full_name)
    expect(page).to have_content(author.full_name)
    expect(page).to have_content(beginner.full_name)
    expect(page).to have_content(expert.full_name)
  end

  scenario "Admin filters commentator", js: true do
    select "Has not any articles", from: :report_with_articles
    select "Has at list one", from: :report_with_comments
    click_on "Search"

    expect(page).to have_content(commentator.full_name)
    expect(page).not_to have_content(author.full_name)
    expect(page).not_to have_content(beginner.full_name)
    expect(page).not_to have_content(expert.full_name)
  end

  scenario "Admin filters author", js: true do
    select "Has at list one", from: :report_with_articles
    select "Has not any comments", from: :report_with_comments
    click_on "Search"

    expect(page).not_to have_content(commentator.full_name)
    expect(page).to have_content(author.full_name)
    expect(page).not_to have_content(beginner.full_name)
    expect(page).not_to have_content(expert.full_name)
  end

  scenario "Admin filters beginner", js: true do
    select "Has not any articles", from: :report_with_articles
    select "Has not any comments", from: :report_with_comments
    click_on "Search"

    expect(page).not_to have_content(commentator.full_name)
    expect(page).not_to have_content(author.full_name)
    expect(page).to have_content(beginner.full_name)
    expect(page).not_to have_content(expert.full_name)
  end

  scenario "Admin filters expert", js: true do
    select "Has at list one", from: :report_with_articles
    select "Has at list one", from: :report_with_comments
    click_on "Search"

    expect(page).not_to have_content(commentator.full_name)
    expect(page).not_to have_content(author.full_name)
    expect(page).not_to have_content(beginner.full_name)
    expect(page).to have_content(expert.full_name)
  end

  def add_company(user)
    user.companies.push company
  end
end
