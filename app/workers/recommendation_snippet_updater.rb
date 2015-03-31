class RecommendationSnippetUpdater
  @queue = :snippet_queue
  def self.perform(settings)
    ShopifyAPI::Session.temp(Shop.first.domain,Shop.first.token) do
      theme_id = ShopifyAPI::Theme.all.find { |theme| theme.role == 'main'}.id
      content = File.read(File.join('app', 'templates', 'recommendation_form.html.erb'))
      snippet_content = ERB.new(content).result(OpenStruct.new(settings).instance_eval { binding })
      log.debug "snippet content: #{snippet_content}"  
      ShopifyAPI::Asset.create(key: 'snippets/recomify.liquid', theme_id: theme_id, value: snippet_content) 
    end
  end
end
