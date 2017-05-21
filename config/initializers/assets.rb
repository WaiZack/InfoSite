# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#css files
Rails.application.config.assets.precompile += %w( light-bootstrap-dashboard.css )
Rails.application.config.assets.precompile += %w( dash.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( agency.css )
Rails.application.config.assets.precompile += %w( zigzagtimeline.css )
Rails.application.config.assets.precompile += %w( lineartimeline.css )
Rails.application.config.assets.precompile += %w( accordion.css )
Rails.application.config.assets.precompile += %w( form-elements.scss )
Rails.application.config.assets.precompile += %w( awesome-bootstrap-checkbox.scss)
Rails.application.config.assets.precompile += %w( coming.css )
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( time.css )
Rails.application.config.assets.precompile += %w( talk.css )


#js files
Rails.application.config.assets.precompile += %w( light-bootstrap-dashboard.js )
Rails.application.config.assets.precompile += %w( loginScripts.js )
Rails.application.config.assets.precompile += %w( agency.js )
Rails.application.config.assets.precompile += %w( jquery.countdown.min.js )
