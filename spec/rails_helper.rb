ENV["RAILS_ENV"] ||= "test"

require "spec_helper"

require "simplecov"
SimpleCov.start "rails" do
  add_filter ".bundle/"
  add_filter "app/models/ckeditor/*"
  add_filter "app/uploaders/*"
  add_filter "classes/seeds_helper"
  add_filter "lib/*"
end

require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
