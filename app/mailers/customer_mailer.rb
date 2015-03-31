class CustomerMailer < ApplicationMailer

  def recommendation_email recommendation
    @recommendation = recommendation
    @product = recommendation.product
    @customer = recommendation.customer

    mail(to: "ibtkm2009@gmail.com", subject: "#{@customer.name} recommends you the product #{@product.name}")
  end

  
end
