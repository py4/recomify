class RecomifyController < ApplicationController
  around_filter :shopify_session

  def settings
  end

  def update
    Shop.first.update_attributes settings: params[:shop][:settings]
    flash[:notice] = "Updated form style"
    Resque.enqueue(RecommendationSnippetUpdater, params[:shop][:settings])
  	redirect_to settings_recomify_path
  end

end

