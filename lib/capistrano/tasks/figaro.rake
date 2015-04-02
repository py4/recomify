namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    on roles(:app) do
      upload! "config/application.yml", "#{shared_path}/application.yml", via: :scp
      upload! "config/shopify_app.yml", "#{shared_path}/shopify_app.yml", via: :scp
    end
  end
 
  desc "Symlink application.yml to the release path"
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/application.yml #{current_path}/config/application.yml"
      execute "ln -sf #{shared_path}/shopify_app.yml #{current_path}/config/shopify_app.yml"
    end
  end
end
