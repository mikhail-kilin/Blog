require "rails_helper"

describe FilteredArticlesQuery do
  subject(:query) { described_class.new(Article.all, filter_params) }

  let(:company) { create :company, owner: user }
  let(:user) { create :user }
  let(:another_user) { create :user, full_name: "Test3" }
  let!(:title_word_article) { create :article, :published, user: user, company: company, title: "Test1" }
  let!(:content_word_article) { create :article, :published, user: user, company: company, content: "Test2" }
  let!(:article_from_another_author) { create :article, :published, user: another_user, company: company }

  describe "#all" do
    context "with all items" do
      let(:filter_params) { {} }

      it "returns all articles" do
        expect(query.all).to match_array(Article.all.to_a)
      end
    end

    context "with search by title" do
      let(:filter_params) { { data: "Test1" } }

      it "returns all articles" do
        expect(query.all).to match_array([title_word_article])
      end
    end

    context "with search by content" do
      let(:filter_params) { { data: "Test2" } }

      it "returns all articles" do
        expect(query.all).to match_array([content_word_article])
      end
    end

    context "with search by user" do
      let(:filter_params) { { data: "Test3" } }

      it "returns all articles" do
        expect(query.all).to match_array([article_from_another_author])
      end
    end
  end
end
