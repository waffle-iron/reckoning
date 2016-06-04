source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'

gem 'pg'

gem 'stripe', github: 'stripe/stripe-ruby'
gem 'money'
gem 'valvat'

gem 'active_model_serializers'

gem 'sidekiq'
# # for sidekiq web
gem 'sinatra', github: 'sinatra/sinatra', require: false

gem 'haml'
gem 'haml-rails'
gem 'slim-rails'
gem 'coffee-rails'

gem 'devise', github: 'plataformatec/devise', branch: :master
gem 'devise-two-factor'
gem 'rqrcode-rails3'
gem 'mini_magick'
gem 'cancancan'

gem 'dalli'

gem 'url_plumber'
gem 'kaminari'

gem 'dynamic_fields_for_rails'

gem 'workflow'

gem 'sass-rails', '~> 6.0.0.beta1'
gem 'bourbon'

gem 'bootstrap-sass'
gem 'font-awesome-sass'

gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'

gem 'redis', '~> 3.0'

gem 'js-routes'

gem 'uglifier'

gem 'redcarpet'

gem 'puma'

gem "i18n-js", ">= 3.0.0.rc11"
gem 'rails-i18n', '~> 5.0.0.beta3'

gem 'thor'
gem 'highline'

gem 'bower-rails'

gem 'roo'

gem 'rack-cors', require: 'rack/cors'

gem 'dropbox-sdk'

gem 'web_translate_it'

gem 'sentry-raven'

gem 'typhoeus'

gem 'peek'
gem 'peek-sidekiq'
gem 'peek-git'
gem 'peek-host'
gem 'peek-pg'
gem 'peek-redis'
gem 'peek-performance_bar'

# pdf rendering
gem 'wicked_pdf'
gem 'wkhtmltopdf-heroku'

# heroku production
gem 'rails_12factor', group: :production
gem 'non-stupid-digest-assets'

gem 'pry-rails', group: :development

group :test do
  gem 'minitest-rails', github: 'blowmage/minitest-rails', branch: :master
  gem 'ruby-prof'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'mocha', require: false
  gem 'timecop'
  gem "codeclimate-test-reporter", require: false
end

group :development, :test do
  gem 'rubocop', require: false

  # generate fake data
  gem 'faker'

  # debugging
  gem 'bullet'
  gem 'byebug'
  gem 'spring'
end

group :development do
  gem 'web-console'
end
