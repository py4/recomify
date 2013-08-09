class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def index
    # get 10 products
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    # get latest 5 orders
    @orders   = ShopifyAPI::Order.find(:all, :params => {:limit => 5, :order => "created_at DESC" })
  end

  def modal
  end

  def regular_app_page
  end

  def help
  end

  def form_page
  end

  def save_unicorns
    @unicorns_qty = params[:unicorns_qty]
  end
  
end