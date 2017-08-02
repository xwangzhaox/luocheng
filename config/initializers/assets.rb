# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(ckeditor/config.js)

Rails.application.config.assets.precompile += %w(home.js articles.js categories.js easing.js jquery.swipebox.min.js move-top.js responsiveslides.min.js wow.min.js)
Rails.application.config.assets.precompile += %w(home.css articles.css categories.css animate.css swipebox.css)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
