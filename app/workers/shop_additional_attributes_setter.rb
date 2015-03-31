class ShopAdditionalAttributesSetter
  @queue = :shop_params
  def self.perform(shop_id)
    shop = Shop.find(shop_id)
    ShopifyAPI::Session.temp("http://"+shop.domain, shop.token) do
      obj = ShopifyAPI::Shop.current
      Shop.find(shop_id).update_attributes(money_format: obj.money_format.gsub(/<[^>]*>/ui, ''))
    end
  end
end
