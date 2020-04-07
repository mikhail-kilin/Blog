require "rails_helper"

RSpec.describe CompanyRole, type: :model do
  let(:user) { create :user }
  let(:company) { create :company }

  it "has default 'owner' role" do
    company_role = described_class.create(user: user, company: company)
    expect(company_role.role).to eq("owner")
  end
end
