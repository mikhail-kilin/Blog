CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              "AWS",
    aws_access_key_id:     ENV.fetch("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY_ID"),
    region:                ENV.fetch("AWS_REGION")
  }
  config.fog_directory  = "rails-blog"
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{10.days.to_i}" }
end
