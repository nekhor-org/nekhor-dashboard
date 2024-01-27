source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 4.1'

gem 'puma_worker_killer'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end

## ADDITIONALS GEMS:

# https://github.com/heartcombo/simple_form
gem 'simple_form'

# https://github.com/bootstrap-ruby/bootstrap_form
# gem 'bootstrap_form', '~> 5.0'
# gem "bootstrap_form", git: "https://github.com/bootstrap-ruby/bootstrap_form/", branch: "main"
gem 'bootstrap_form', '~> 5.2'

# https://github.com/nathanvda/cocoon
gem 'cocoon', '1.2.14'

# https://github.com/heartcombo/responders
gem 'responders'

# https://github.com/redis/redis-rb
gem 'redis', '~> 4.0'

# https://github.com/resque/redis-namespace
gem 'redis-namespace'

# https://github.com/redis-store/redis-rack-cache
gem 'redis-rack-cache'

# https://github.com/redis-store/redis-rails
gem 'redis-rails'

# https://github.com/CanCanCommunity/cancancan
gem 'cancancan', '3.0.1'

# https://github.com/heartcombo/devise
gem 'devise', '~> 4.8'

## BACKGROUND JOBS
# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.5'
# gem 'sidekiq', '~> 6.1', '>= 6.0.3'
# gem 'sidekiq', '~> 5.2.7'

# https://github.com/moove-it/sidekiq-scheduler
# gem 'sidekiq-scheduler'
gem 'sidekiq-scheduler', '~> 4.0.2'

# https://github.com/ondrejbartas/sidekiq-cron
gem 'sidekiq-cron', '~> 1.1'

# https://github.com/bkeepers/dotenv
gem 'dotenv-rails'

# https://github.com/RolifyCommunity/rolify
gem 'rolify'

# https://github.com/aws/aws-sdk-ruby
gem 'aws-sdk-s3'

# https://github.com/activerecord-hackery/ransack
gem 'ransack', '~> 3.2.1'

# https://github.com/kaminari/kaminari
gem 'kaminari'

# https://github.com/jwt/ruby-jwt
gem 'jwt', '2.1.0'

# https://github.com/rubysherpas/paranoia
gem 'paranoia', '~> 2.2'

# Log all changes to your models
gem 'audited', '~> 5.0.2'

# https://github.com/cyu/rack-cors
gem 'rack-cors', '1.0.3'

# https://github.com/norman/friendly_id
gem 'friendly_id', '~> 5.5'

# https://github.com/zmbacker/enum_help
gem 'enum_help'

# https://github.com/rails-api/active_model_serializers/tree/0-10-stable/docs
gem 'active_model_serializers'

# https://github.com/bokmann/font-awesome-rails
gem 'font-awesome-rails'

# https://github.com/itmammoth/rails_sortable
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'

# Validations for Active Storage (presence)
gem 'active_storage_validations'

gem "chartkick"
gem "groupdate"

# Call api
gem 'rest-client'

# View components for Rails
gem 'view_component', '~> 2.48'

# Functionality to deal with holidays in Ruby. https://github.com/holidays/holidays
gem 'holidays'

gem 'credit_card_validations'

## VALIDATIONS E CPF_CNPJ: https://github.com/fnando/cpf_cnpj
gem 'cpf_cnpj'

## SENTRY
gem 'sentry-rails'
gem 'sentry-ruby'

## The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web. http://getbootstrap.com
gem "bootstrap", "~> 5.1"

gem 'figaro'

gem 'rqrcode', '~> 2.2'
gem 'retries'

gem 'rack-cors', '1.0.3'

gem 'mina', '1.2.3'

gem 'mina-webpacker'

# Mina tasks for handle with Puma.
# Read more: https://github.com/sandelius/mina-puma
gem 'mina-puma', '1.1.0'

# mina-sidekiq is a gem that adds tasks to aid in the deployment of Sidekiq using Mina.
# Read more: https://github.com/Mic92/mina-sidekiq
gem 'mina-sidekiq', '1.0.3'


gem 'ckeditor', github: 'galetahub/ckeditor'
gem "mini_magick"