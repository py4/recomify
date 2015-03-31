module RecomifyHelper
  def product_admin_url product
    "/products/" + product.product_id
  end

  def product_price product
    product.shop.money_format.gsub("{{amount}}",product.price)
  end

  def product_url product
    "http://" + product.shop.domain + product.url
  end

  def get_price  product
    product.shop.money_format.gsub("{{amount}}",product.price) 
  end

end
