require "rails_helper"

describe CommentsNotificationJob do
  let(:job) { described_class.new }
  let(:user) { create :user }
  let(:company) { create :company, owner: user }
  let(:article) { create :article, user: user, company: company }
  let!(:comment) { create :comment, article: article, user: user, company: company }

  describe "#perform" do
    it "send message" do
      job.perform
      expect(ActionMailer::Base.deliveries.first.to.first).to eq user.email
    end
  end
end
