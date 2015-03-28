class ApplicationController < ActionController::Base
  protect_from_forgery

  def shop_url
    "https://"+ShopifyAPI::Shop.current.domain
  end
end
