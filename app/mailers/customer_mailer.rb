class CustomerMailer < ApplicationMailer

  helper :recomify

  def recommendation_email recommendation
    @recommendation = recommendation
    @product = recommendation.product
    @customer = recommendation.customer

    mail(to: recommendation.email, subject: "#{@customer.name} recommends you the product #{@product.name}")
  end

  
end
