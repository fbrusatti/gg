source 'https://rubygems.org'

gem 'rails', '3.2.13'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'pg'
gem 'devise'
gem 'carrierwave'
gem 'haml'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'
gem 'kaminari'
gem 'rmagick'
# Gemfile in Rails >= 3.1
gem 'activeadmin'
gem "meta_search", '>= 1.1.0.pre'
gem 'font-awesome-sass-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-datatables-rails', :github => 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end

gem 'jquery-rails','~> 2.3.0'
gem 'will_paginate', '>=3.0.pre3'


group :development do
  gem 'haml-rails'
  gem 'better_errors'
  gem 'brakeman',                require: false
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'debugger'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.4', group: :development
  gem 'factory_girl_rails', group: :development
end

group :test do
  gem 'capybara','1.1.2'
  gem 'capybara-webkit', '0.12.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'capybara-select2'
end
