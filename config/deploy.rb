# frozen_string_literal: true
# # capistranoのバージョン固定
# lock "~> 3.16.0"

# set :application, "malicious_fighters"
# # githubのリポジトリ
# set :repo_url, "git@github.com:Hiromu-Sato1989/share_malicious_players.git"
# # デプロイ先
# set :deploy_to, "/var/www/malicious_fighters"

# # デフォルトはmasterブランチ
# set :branch, "main"

# set :user, 'hiromu'

# # 使用するrubyのバージョン
# set :rbenv_ruby, '2.6.6'

# set :linked_files, %w(config/master.key config/database.yml config/.env)
# set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets public/system public/uploads)

# set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
# set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
# # リリースを残す数
# set :keep_releases, 3

# set :log_level, :debug

# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     on roles(:app) do
#       invoke 'unicorn:restart'
#     end
#   end

#   desc 'Create database'
#   task :db_create do
#     on roles(:db) do |_host|
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:create'
#         end
#       end
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end
# end
