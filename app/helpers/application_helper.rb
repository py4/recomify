module ApplicationHelper

  def current_shop_origin
    "https://#{ session[:shopify].url }" if session[:shopify]
  end

end
