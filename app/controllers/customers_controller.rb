class CustomersController < ApplicationController
  around_filter :shopify_session

  def index
    @customers = Customer.includes(:recommendations).all
  end

  def show
    @shop_url = Shop.instance.domain
    @customer = Customer.find(params[:id])
  end
end
