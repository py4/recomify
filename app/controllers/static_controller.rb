class StaticController < ApplicationController
  def hello
  end

  def post_test
    puts params
    puts ShopifyAPI::Product.all

    return render plain: "It's submitted!!!!!"
  end
end
