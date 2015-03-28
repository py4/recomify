class RecomifyController < ApplicationController
  around_filter :shopify_session

  def settings
  end

  def update
  	s = Shop.instance
    s.settings = params[:shop][:settings]
    s.save!
    flash[:notice] = "Updated form style"
    update_recommendation_snippet s.settings
  	redirect_to settings_recomify_path
  end

  private
	
  def update_recommendation_snippet settings
	  theme_id = current_theme
	ShopifyAPI::Asset.create(key: 'snippets/recomify.liquid', theme_id: theme_id, value: get_html_form(settings))
    end

	def current_theme
		ShopifyAPI::Theme.all.find { |theme| theme.role == 'main'}.id
	end

  def get_html_form settings
    content = File.read(File.join(Rails.root.to_s, 'config', 'recommendation_form'))
    settings.each do |key, value|
      content.sub! '@'+key, value
    end
    return content
  end

end
