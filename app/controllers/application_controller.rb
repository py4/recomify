class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_current_shop
  
  def set_current_shop
    return unless session[:shopify]
    @current_shop ||= Shop.where(id: session[:shopify]).first
    reset_session unless @current_shop
  end

  def current_shop_id
    session[:shopify]
  end

end
