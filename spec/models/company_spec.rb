require "rails_helper"

describe Company do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_presence_of :slug }
end
