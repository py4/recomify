source "https://rubygems.org"
#ruby "2.1.5"

gem "rails", "4.2.0"

#gem 'acts_as_singleton'
gem 'rb-readline'
gem "shopify_app", "~> 5.0.2"
gem "jquery-rails"
gem "quiet_assets"
gem "pg"
gem "simple_form"
gem 'jquery-minicolors-rails'
gem 'aws-ses', '~> 0.4.4', require: 'aws/ses'
gem 'figaro'
gem 'delayed_job_active_record'
gem 'foreman'
gem 'daemons'
gem 'resque', "~> 2.0.0.pre.1", github: "resque/resque"
gem 'resque-web', git: 'https://github.com/resque/resque-web.git', branch: 'resque-2', require: 'resque_web'

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier", ">= 1.0.3"
end

group :development, :test do
  gem "delayed_job_web"
  gem "thin"
  gem "less-rails-bootstrap"
  gem "therubyracer", platforms: :ruby
  gem "pry-rails"
  gem "byebug"
  gem "web-console", '~> 2.0'
  gem "meta_request"
  gem 'better_errors'
  gem 'binding_of_caller'
end
