class RecommendationsController < ApplicationController
  around_filter :shopify_session
  
  def settings
  end

  def update_settings
    s = Shop.instance
    s.settings = params[:shop][:settings]
    s.save!
    puts "settings flash"
    flash[:notice] = "Updated form style"
    redirect_to settings_recommendations_path
    #render 'settings'
  end

end
