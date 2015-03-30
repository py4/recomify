class CustomersController < ApplicationController
  around_filter :shopify_session

  def index
    @customers = Customer.includes(:recommendations).all
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
