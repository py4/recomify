class CustomersController < ApplicationController
  around_filter :shopify_session

  def index
    @customers = Customer.includes(:recommendations).all
  end
end
