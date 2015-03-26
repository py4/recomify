class RecomifyController < ApplicationController
  around_filter :shopify_session

  def index_settings
  end

  def update_settings
    s = Shop.instance
    s.settings = params[:shop][:settings]
    s.save!
    flash[:notice] = "Updated form style"
    redirect_to index_settings_recomify_path
  end

end
