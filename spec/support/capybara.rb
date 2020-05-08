require "webdrivers/chromedriver"

Capybara.configure do |config|
  config.match = :prefer_exact
  config.javascript_driver = :selenium_chrome
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end
