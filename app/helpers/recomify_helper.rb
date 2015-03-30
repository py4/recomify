module RecomifyHelper
  def shop_url
    Shop.instance.domain
  end

  def product_admin_url product
    Shop.instance.domain + "/products/" + product.product_id
  end
end
