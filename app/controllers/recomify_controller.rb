class RecomifyController < ApplicationController
  around_filter :shopify_session

  def settings
  end

  def update
    @current_shop.update_attributes settings: params[:shop][:settings]
    flash[:notice] = "Updated form style"
    Resque.enqueue(RecommendationSnippetUpdater, @current_shop.id, params[:shop][:settings].merge(server_address: ENV['server_address'])
  	redirect_to settings_recomify_path
  end

end

