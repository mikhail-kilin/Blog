CarrierWave.configure do |config|
  if ENV["AWS_REGION"]
    config.fog_credentials = {
      provider:              "AWS",
      aws_access_key_id:     ENV.fetch("AWS_ACCESS_KEY_ID"),
      aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY_ID"),
      region:                ENV.fetch("AWS_REGION")
    }
    config.fog_directory = ENV.fetch("AWS_BUCKET")
  end
  config.fog_public     = true
  config.fog_attributes = { cache_control: "public, max-age=#{730.days.to_i}" }
end
