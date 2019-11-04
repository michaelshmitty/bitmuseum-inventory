source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'
gem 'haml', '~> 5.1.2'
gem 'puma', '~> 4.2.1'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '~> 1.1.4'
gem 'devise', '~> 4.7.1'
gem 'simple_form', '~> 5.0.1'
gem 'kaminari', '~> 1.1.1'
gem 'bootstrap-kaminari-views', git: 'https://github.com/kalashnikovisme/bootstrap-kaminari-views.git'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'pundit', '~> 2.1.0'
gem 'aasm', '~> 5.0.6'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'rspec-rails', '~> 3.9.0'
  gem 'rails-controller-testing'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener', '~> 1.7.0'
  gem 'guard', '~> 2.16.1'
  gem 'guard-rspec', '~> 4.7.3', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers', '~> 4.1.2'
  gem 'email_spec'
  gem 'database_cleaner'
end

group :production do
  gem 'rack-timeout', '~> 0.5.2'
end
