module RecomifyHelper
  def shop_url
    Shop.first.domain
  end

  def product_admin_url product
    "/products/" + product.product_id
  end

  def product_price product
    Shop.first.money_format.gsub("{{amount}}",product.price)
  end

  def product_url product
    shop_url + product.url
  end

  def get_price product
    Shop.first.money_format.gsub("{{amount}}",product.price) 
  end

end
