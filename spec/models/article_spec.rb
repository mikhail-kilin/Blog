require "rails_helper"

RSpec.describe Article, type: :model do
  it { is_expected.to validate_presence_of :title }

  it { is_expected.to validate_presence_of :content }

  it "Default value of status is 'draft'" do
    article = Article.create(title: "title", content: "content")
    expect(article.status).to eq("draft")
  end
end
