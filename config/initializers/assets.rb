# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( songs_show.js )
Rails.application.config.assets.precompile += %w( plugins/progressbar/progressbar.min.js )

Rails.application.config.assets.precompile += %w( songs_show.css )
Rails.application.config.assets.precompile += %w( songs_index.js )
Rails.application.config.assets.precompile += %w( songs_index.css )
Rails.application.config.assets.precompile += %w( static_pages.js )
Rails.application.config.assets.precompile += %w( static_pages.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
