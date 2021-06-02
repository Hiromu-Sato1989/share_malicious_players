# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# 定数管理
gem 'config'
# カウンターキャッシュ
gem 'counter_culture', '~> 2.0'
# 静的ページの簡易作成
gem 'high_voltage'
# slim形式へ変換
gem 'html2slim'
# デバッグ時にbinding.pryを使えるようにする
gem 'pry-rails'
# 検索機能
gem 'ransack'
# slimを使えるようにする
gem 'slim-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '= 6.0.3.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # 1 + Nを検知
  gem 'bullet'
  # rspecでfactorybotを使えるようにする
  gem 'factory_bot_rails'
  # rspec導入
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # エラー画面詳細化
  gem 'better_errors'
  # エラー画面でデバッグが可能になる
  gem 'binding_of_caller'
  # メールのテストができる
  gem 'letter_opener_web'
  # LINTチェック
  gem 'rubocop', '= 1.12.1', require: false
  gem 'rubocop-rails', '= 2.9.1', require: false
  gem 'rubocop-rspec'

  # # 以下capistrano関連
  # gem 'capistrano'
  # gem 'capistrano-bundler'
  # gem 'capistrano-rails'
  # gem 'capistrano-rbenv'
  # gem 'capistrano3-unicorn'
  # # webpacker対応
  # gem 'ed25519'
  # gem 'bcrypt_pbkdf'
end

group :production, :staging do
  gem 'unicorn'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# パンくずリスト
gem 'gretel'
# 閲覧数集計
gem 'impressionist',
    git: 'git://github.com/charlotte-ruby/impressionist.git',
    ref: '46a582ff8cd3496da64f174b30b91f9d97e86643'
# 管理者画面
gem 'rails_admin'
# 国際化
gem 'rails-i18n'
# ログイン機能
gem 'sorcery'
# 画像アップロード機能
gem 'carrierwave', '~> 2.0'
# S3アップロード
gem 'fog-aws'
