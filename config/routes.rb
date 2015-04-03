EmbededApp::Application.routes.draw do

  mount ResqueWeb::Engine => "/resque_web"

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end


  resource :recomify, controller: :recomify, only: [] do
    get 'settings'
    put 'update'
  end

  resources :recommendations, only: [:create, :index, :show]
  resources :customers, only: [:index, :show]

  post 'post_test' => 'static#post_test'
  #get 'modal' => "home#modal", :as => :modal
  #get 'modal_buttons' => "home#modal_buttons", :as => :modal_buttons
  #get 'regular_app_page' => "home#regular_app_page"
  #get 'help' => "home#help"
  #get 'pagination' => "home#pagination"
  #get 'breadcrumbs' => "home#breadcrumbs"
  #get 'buttons' => "home#buttons"
  #get 'form_page' => "home#form_page"
  #post 'form_page' => "home#form_page"
  #get 'error' => 'home#error'
  #get 'index' => 'home#index'

  #root :to => 'recomify#settings'
  root :to => 'recommendations#index'
  #root :to => 'static#hello'
  #root :to => 'home#index'
end
