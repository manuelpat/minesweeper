source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'active_model_serializers', '~> 0.10.8'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 2.0'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'rspec-rails', '~> 5.0'
  gem 'shoulda', '~> 3.6.0'
  gem 'shoulda-matchers', '~> 3.1.3'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end
