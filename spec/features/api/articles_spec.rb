require "rails_helper"

feature "Get Comments" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }
  let(:article) { FactoryBot.create :article, :company, user: user, company: company }

  background do
    FactoryBot.create_list :comment, 2, user: user, article: article
    visit comments_v1_article_path(article)
  end

  scenario "I can get comments of article" do
    expect(page).to have_content(Comment.first.content)
    expect(page).to have_content(Comment.last.content)
  end
end
