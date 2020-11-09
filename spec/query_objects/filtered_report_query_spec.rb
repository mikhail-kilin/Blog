require "rails_helper"

describe FilteredReportQuery do
  subject(:query) { described_class.new(User.all, filter_params) }

  let(:company) { create :company, owner: expert }
  let(:commentator) { create :user }
  let(:author) { create :user }
  let(:expert) { create :user }
  let!(:beginner) { create :user }
  let!(:author_article) { create :article, :company, company: company, user: author }
  let!(:expert_article) { create :article, :company, company: company, user: expert }
  let!(:commentator_comment) { create :comment, article: author_article, user: commentator }
  let!(:expert_comment) { create :comment, article: expert_article, user: expert }

  describe "#all" do
    context "with all items" do
      let(:filter_params) { {} }

      it "returns all discounts" do
        expect(query.all).to match_array(User.all.to_a)
      end
    end

    context "with with_comments: true filter params" do
      let(:filter_params) { { with_comments: "true" } }

      it "returns users with comments_count > 0" do
        expect(query.all).to match_array([expert, commentator])
      end
    end

    context "with with_comments: false filter params" do
      let(:filter_params) { { with_comments: "false" } }

      it "returns users with comments_count = 0" do
        expect(query.all).to match_array([beginner, author])
      end
    end

    context "with with_articles: true filter params" do
      let(:filter_params) { { with_articles: "true" } }

      it "returns users with articles_count > 0" do
        expect(query.all).to match_array([author, expert])
      end
    end

    context "with with_articles: false filter params" do
      let(:filter_params) { { with_articles: "false" } }

      it "returns users with articles_count = 0" do
        expect(query.all).to match_array([beginner, commentator])
      end
    end
  end
end
