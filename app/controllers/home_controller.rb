class HomeController < ApplicationController
  
  around_filter :shopify_session
  
  def index
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