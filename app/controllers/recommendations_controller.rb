class RecommendationsController < ApplicationController

  around_filter :shopify_session, except: [:create]

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def index
    @shop_url = Shop.instance.domain
    @recommendations = Recommendation.includes(:customer).all
  end

  def create
    customer = Customer.find_or_initialize_by(email: customer_params[:email])
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
