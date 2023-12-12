require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/puma'
require 'mina_sidekiq/tasks'
require 'mina/rbenv'

set :application, 'nekhor_dashboard'
set :domain, '146.190.143.50'#'191.252.204.147' # nekhor_dashboard-prod
set :user, 'deploy'#'root'

set :deploy_to, "/var/www/nekhor_dashboard"
# set :deploy_to, "/var/www/nekhor_dashboard-homolog"
set :repository, 'git@github.com:juniornelson123/nekhor_dashboard.git'

set :branch, 'main' #producao

set :forward_agent, true

# set :identity_file, '~/.ssh/ugate-prod' #producao
# set :identity_file, '~/.ssh/novosaque-prod.pem' #homologacao

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'node_modules', 'storage', 'tmp', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')
set :shared_paths, ['tmp/sockets', 'tmp/pids']

# set :rvm_use_path, '/home/deploy/.rvm/scripts/rvm'
# set :rvm_path, '/home/deploy/.rvm/scripts/rvm'
# set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
# set :keep_releases, 10

# set :force_asset_precompile, true
# task :remote_environment do
#   invoke :'rvm:use', 'ruby-2.7.1'
# end
set :rbenv_path, "/home/deploy/.rbenv"



task :remote_environment do
  invoke :'rbenv:load'
end

# task :'rbenv:load' do
#   comment %{Loading rbenv}
#   command %{export RBENV_ROOT="#{fetch(:rbenv_path)}"}
#   command %{export PATH="#{fetch(:rbenv_path)}/bin:$PATH"}
#   command %{
#     if ! which rbenv >/dev/null; then
#       echo "! rbenv not found"
#       echo "! If rbenv is installed, check your :rbenv_path setting."
#       exit 1
#     fi
#   }
#   command %{eval "$(rbenv init -)"}
# end

# task :remote_environment do
#   invoke :'rvm:use', 'ruby-3.0.6'
# end

task :setup do
  command %(mkdir -p "/#{fetch(:shared_path)}/config")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/config")

  command %(mkdir -p "/#{fetch(:shared_path)}/tmp/pids")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/pids")

  command %(mkdir -p "/#{fetch(:shared_path)}/tmp/sockets")
  command %(chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/sockets")

  command %(touch "/#{fetch(:shared_path)}/config/application.yml")
  command %(touch "/#{fetch(:shared_path)}/config/database.yml")
  command %(touch "/#{fetch(:shared_path)}/config/secrets.yml")
end

desc 'Copy assets'
task :link_assets do
  command %(rm -rf "/var/www/nekhor_dashboard/current/public/assets")
  command %(ln -s "/var/www/nekhor_dashboard/current/public/assets-js" "/var/www/nekhor_dashboard/current/public/assets")
end

desc 'Stop sidekiq'
task :sidekiq_stop do
  command %(sudo service sidekiq stop)
end

desc 'Restart sidekiq'
task :sidekiq_restart do
  command %(sudo service sidekiq restart)
end

desc "Seed data to the database"
task :seed do
  command %(cd /#{fetch(:current_path)})
  command %(RAILS_ENV=production bundle exec rake db:migrate db:seed)
end

desc "megrate data to the database"
task :migrate do
  command %(cd /#{fetch(:current_path)})
  command %(RAILS_ENV=production bundle exec rake db:migrate)
end

# desc 'Compile assets with webpack'
# task webpack: :remote_environment do
#   command %(yarn install)
#   command %(NODE_ENV=production RAILS_ENV=production bundle exec rails webpacker:compile)
#   # command %{bundle exec rails webpacker:compile}
#   # command 'RAILS_ENV=production bundle exec rails webpacker:compile'
# end
desc 'Stop sidekiq'
task :sidekiq_stop do
  command %(sudo service sidekiq stop)
end

desc 'Restart sidekiq'
task :sidekiq_restart do
  command %(sudo service sidekiq restart)
end



desc "Deploys the current version to the server."
task :deploy do
  on :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    # invoke :'sidekiq:quiet'
    invoke :'deploy:link_shared_paths'
    invoke :'rbenv:load'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'deploy:cleanup'
    # invoke :'sidekiq:quiet'

    on :launch do
      # invoke :'rbenv:load'
      # invoke :'puma:phased_restart'
      invoke :'puma:hard_restart'
      # invoke :sidekiq_restart
      # invoke :'sidekiq:restart'
      # invoke :'sitemap:refresh'
    end
  end
end
