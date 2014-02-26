source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '~> 3.2.17'

gem 'shopify_app'
gem 'jquery-rails'
gem 'quiet_assets'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'thin'
  gem "less-rails-bootstrap"
  gem "therubyracer", :platforms => :ruby
  gem 'pry-rails'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
