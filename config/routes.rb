EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  get 'modal' => "home#modal", :as => :modal
  get 'regular_app_page' => "home#regular_app_page"
  get 'help' => "home#help"

  root :to => 'home#index'
end
