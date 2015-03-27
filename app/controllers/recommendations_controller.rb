class RecommendationsController < ApplicationController
  def create
    customer = Customer.find_or_initialize_by(email: params[:customer_email])
    unless customer.persisted?
      customer = Customer.create customer_params
      puts "created a customer!"
    end

    customer.recommendations.create recommendation_params
  end

  private
  
  def customer_params
    params.require(:customer).permit(:customer_id,:name, :email)
  end

  def recommendation_params
    params.require(:recommendation).permit(:email,:comment, :product_id, :product_name, :product_url) 
  end
end
