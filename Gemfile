source 'http://rubygems.org'

gem 'rails', '3.1.0'

# For rails 3.1
gem 'coffee-script'
gem 'uglifier'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'mysql2'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "devise","~> 1.4.3"
gem "slim", "~> 1.0.2"
gem "haml", "~> 3.1.3"

#gem "jammit"
gem "jquery-rails"
gem 'choices', :git => "git://github.com/teambox/choices.git"
gem "omniauth", "~> 0.2.0"
gem 'show_for'
gem 'simple_form', :git => "git://github.com/plataformatec/simple_form.git"
gem 'sass'
gem 'cancan', '~> 1.4.1'
gem 'paperclip', '~> 2.3.6'
gem "will_paginate", :git=>"git://github.com/mislav/will_paginate.git", :branch=>"rails3"
gem 'compass', :git => 'git://github.com/chriseppstein/compass.git', :branch => 'rails31'
gem 'sass-rails', "~> 3.1.0"

group :development do
  gem 'rails-footnotes', :git => "git://github.com/zhongqf/rails-footnotes.git"
  gem "haml-rails"
  gem "slim-rails", "~> 0.2.1"
  gem "rails3-generators", :git => "git://github.com/zhongqf/rails3-generators.git"
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test, :development do 
  gem "capybara"
  gem 'pry'

  gem "cucumber-rails"
  gem "rspec-rails", "~> 2.6.1"
  gem "factory_girl_rails", "~> 1.2.0"
  
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'timecop'
  gem 'faker'
  gem 'rcov'
  gem 'pickle'
  gem 'launchy'
  gem 'spork', '~> 0.9.0.rc'
  gem 'shoulda-matchers', '~> 1.0.0.beta3'

  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-cucumber"
  gem "guard-migrate"
  gem 'rb-fsevent'
  gem 'growl_notify'
  #gem 'growl'
end


