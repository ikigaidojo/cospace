source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.5"

# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 3.7"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do

  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"

  gem "rspec-rails",      "3.7.2"                  # https://github.com/rspec/rspec-rails 
  gem "guard-rspec",      "4.7.3",  require: false # https://github.com/guard/guard-rspec
  gem "awesome_print",    "1.8.0"                  # https://github.com/awesome-print 
  gem "simplecov",        "0.16.1", require: false # https://github.com/colszowka/simplecov
  gem "shoulda-matchers", "3.1.2"                  # https://github.com/thoughtbot/shoulda-matchers
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "devise",             "4.4.3"                  # https://github.com/plataformatec/devise#getting-started
gem "simple_calendar",    "2.2.7"                  # https://github.com/excid3/simple_calendar
gem "bootstrap",          "4.1.1"                  # https://github.com/twbs/bootstrap  
gem "high_voltage",       "3.1.0"                  # https://github.com/thoughtbot/high_voltage
gem "jquery-rails"                                 # https://github.com/rails/jquery-rails
gem "money",              "6.11.3"                 # https://github.com/RubyMoney/money
gem "wicked_pdf",         "1.1.0"                  # https://github.com/mileszs/wicked_pdf
gem "wkhtmltopdf-binary", "0.12.3.1"               # https://github.com/zakird/wkhtmltopdf_binary_gem
gem "faker",              "1.8.7"                  # https://github.com/stympy/faker
gem "dotenv-rails",       "2.4.0"                  # https://github.com/bkeepers/dotenv
