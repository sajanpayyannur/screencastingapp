source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'haml-rails'

gem 'jquery-rails'
gem 'fancybox-rails'

gem 'cancan'
gem 'rolify'

gem 'devise'
gem "omniauth-openid"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "friendly_id", "~> 4.0.1"
gem "nokogiri"

# Payment integration
gem 'activemerchant'

# Automated web interaction
gem 'mechanize'

gem 'simple_form'

# Upload and Amazon S3
gem 'paperclip'
gem 'aws-sdk'

gem 'chosen-rails'
gem 'ariane'

# Slider
gem 'bxslider-rails'

gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
gem 'tinymce-rails'

# For CRON jobs
gem 'whenever', :require => false

gem 'will_paginate', '~> 3.0'

group :development do
  gem 'pg'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
  gem 'thin'
  gem 'sqlite3'
  gem 'mysql2'
end

group :production do
  gem 'pg'
end

group :production, :staging do
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  #gem 'compass-rails', '~> 1.0.3'
  #gem 'zurb-foundation', '~> 3.0.1'

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'factory_girl_rails', '~> 3.3.0'
end

group :development, :test do
  gem 'debugger'
end
