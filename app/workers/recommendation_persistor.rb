class RecommendationPersistor
  @queue = :customer_queue
  def self.perform(product_price, recommendation_params, product_id, customer_id, shop_domain)

    shop = Shop.where(domain: shop_domain).first
    return unless shop

    customer = self.create_customer shop, customer_id
    return unless customer

    product = self.create_product shop, product_id, product_price
    return unless product
    
    shop.recommendations.create recommendation_params.merge(product_id: product.id, customer_id: customer.id)
  end

  def self.get_product shop, product_id
    ShopifyAPI::Session.temp("http://"+shop.domain, shop.token) do
      ShopifyAPI::Product.all.find { |product| product.id.to_s == product.id.to_s }
    end
  end

  def self.get_customer shop, customer_id
    ShopifyAPI::Session.temp("http://"+shop.domain, shop.token) do
      ShopifyAPI::Customer.all.find { |customer| customer.id.to_s == customer_id.to_s}
    end
  end

  def self.create_customer shop, customer_id
    customer = shop.customers.where(customer_id: customer_id).first
    unless(customer)
      customer = self.get_customer shop, customer_id
      return nil unless customer
      customer = shop.customers.create name: customer.first_name + " " + customer.last_name,email: customer.email, customer_id: customer_id
    end
    return customer
  end

  def self.create_product shop, product_id, product_price
    product = shop.products.where(product_id: product_id).first
    unless(product)
      product = self.get_product shop, product_id
      return nil unless product
      product = shop.products.create product_id: product_id, name: product.title, description: product.body_html, url: '/products/'+product.handle, price: product_price
    end
    return product
  end

end
