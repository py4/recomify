EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  get 'modal' => "home#modal", :as => :modal

  root :to => 'home#index'
end
