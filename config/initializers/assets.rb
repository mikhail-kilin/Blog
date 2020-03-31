Rails.application.config.assets.version = ENV.fetch("ASSETS_VERSION", "1.0")
Rails.application.config.assets.precompile += %w[mailer ckeditor/config.js admin.scss admin.js]
