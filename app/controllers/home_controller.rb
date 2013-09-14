class HomeController < ApplicationController
  
  around_filter :shopify_session
  
  def index
  end

  def modal
  end

  def regular_app_page
  end

  def help
  end

  def form_page
    if request.post?
      if params[:name].present?
        flash[:notice] = "Created #{ params[:colour] } unicorn: #{ params[:name] }."
      else
        flash[:error] = "Name must be set."
      end
    end
  end
  
end