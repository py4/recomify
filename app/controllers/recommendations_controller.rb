class RecommendationsController < ApplicationController

  around_filter :shopify_session, except: [:create]
  before_filter :add_headers, only: [:create]

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def index
    @recommendations = Recommendation.includes(:customer, :product).all
  end

  def create
    email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

    return render plain: "Email format is incorrect" unless email_regex.match(recommendation_params[:email])
    return render plain: "Comment cannot be empty" if recommendation_params[:comment] == ""
    
    render plain: "Recommendation submitted!"
    Resque.enqueue(RecommendationPersistor, product_price, recommendation_params, params[:product][:product_id], params[:customer][:customer_id], shop_domain)
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:email,:comment) 
  end

  def product_id
    params[:product][:product_id]
  end

  def shop_domain
    params[:shop][:domain]
  end

  def customer_id
    params[:customer][:customer_id]
  end

  def product_price
    params[:product][:price]
  end

end
