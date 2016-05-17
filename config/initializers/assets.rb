# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( pdf.css pdfjs-dist/build/pdf.worker.js )
Rails.application.config.assets.precompile += %w( github.png )
Rails.application.config.assets.precompile += %w( example-1.png example-1-small.png )
Rails.application.config.assets.precompile += %w( example-2.png example-2-small.png )
Rails.application.config.assets.precompile += %w( example-3.png example-3-small.png )
Rails.application.config.assets.precompile += %w( favicon.svg favicon.png )
Rails.application.config.assets.precompile += %w( touch-icon-iphone.png touch-icon-iphone-retina.png )
Rails.application.config.assets.precompile += %w( touch-icon-ipad.png touch-icon-ipad-retina.png )
Rails.application.config.assets.precompile += Dir[Rails.root.join('vendor', 'assets', 'bower_components', '**', 'img', '*')]
