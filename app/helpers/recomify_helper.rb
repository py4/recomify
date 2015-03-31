module RecomifyHelper
  def product_admin_url product
    "/products/" + product.product_id
  end

  def product_price shop, product
    shop.money_format.gsub("{{amount}}",product.price)
  end

  def product_url shop, product
    shop.domain + product.url
  end

  def get_price shop, product
    shop.money_format.gsub("{{amount}}",product.price) 
  end

end
