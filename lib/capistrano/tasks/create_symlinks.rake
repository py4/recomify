namespace :deploy do
#  desc "Recreate symlink for current version"
#  task :resymlink do
#    on roles(:app) do
#      execute "rm -f #{current_path} && ln -s #{release_path} #{current_path}"
#    end
#  end
  desc "Symlinks the database.yml"
  task :symlink_db  do
    on roles(:app) do
      execute "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    end
  end
 # end


  #desc "Symlink shared config file"
  #task :create_config_symlinks do
  #  on roles(:app) do
   #   execute "rm -rf #{current_path }/config/database.yml && ln -s #{deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"

    #  execute "rm -rf #{release_path}/config/database.yml && ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    #end
  #end

end


