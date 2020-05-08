Apipie.configure do |config|
  config.translate               = false
  config.default_locale          = nil
  config.app_name                = "Blog"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = Rails.root.join("app", "controllers", "**", "*.rb")
end
