class ApplicationController < ActionController::Base
  protect_from_forgery

#  def shop_url
#    puts "shop domain:  #{@@shop_domain}"
#    @@shop_domain ||= "https://"+ShopifyAPI::Shop.current.domain
#    return @@shop_domain
#  end
end
