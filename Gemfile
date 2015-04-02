source "https://rubygems.org"
#ruby "2.1.5"

gem "rails", "4.2.0"

gem 'rb-readline'
gem "shopify_app", "~> 5.0.2"
gem "jquery-rails"
gem "quiet_assets"
gem "pg"
gem "simple_form"
gem 'jquery-minicolors-rails'
gem 'aws-ses', '~> 0.4.4', require: 'aws/ses'
gem 'figaro'
gem 'foreman'
gem 'daemons'
gem 'resque', "~> 2.0.0.pre.1", github: "resque/resque"
gem 'resque-web', git: 'https://github.com/resque/resque-web.git', branch: 'resque-2', require: 'resque_web'
gem 'thin'
gem "therubyracer", platforms: :ruby

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier", ">= 1.0.3"
end

group :development, :test do
  gem "less-rails-bootstrap"
  gem "pry-rails"
  gem "byebug"
  gem "web-console", '~> 2.0'
  gem "meta_request"
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'capistrano',  '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-postgresql', '~> 4.2.0'
  gem 'capistrano-rbenv', '~> 2.0'

end
