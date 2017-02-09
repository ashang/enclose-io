source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'devise', '~> 4.2'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'retina_tag', '~> 1.4', '>= 1.4.1'
gem 'font-awesome-rails', '~> 4.6', '>= 4.6.3.1'
gem 'simple_form', '~> 3.3', '>= 3.3.1'
gem 'airbrake', '~> 5.5'
gem 'carrierwave', '~> 0.11.2'
gem 'carrierwave-aws', '~> 1.0', '>= 1.0.2'
gem 'sidekiq', '~> 4.2', '>= 4.2.3'
gem 'rails_admin', '~> 1.0'
gem 'rails-timeago', '~> 2.15'
gem 'bootstrap', '~> 4.0.0.alpha6'

group :development, :test do
  gem 'byebug', '>= 9.0.6', platform: :mri
  gem 'pry', '>= 0.10.4'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
end

group :development do
  gem 'web-console', '>= 3.3.1'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '>= 2.0.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'certified', platforms: [:mingw, :mswin, :x64_mingw]
