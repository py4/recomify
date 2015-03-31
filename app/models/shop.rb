class Shop < ActiveRecord::Base
  #acts_as_singleton
  store_accessor :settings

  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy

  after_create :initialize_settings
  
  #after_commit :set_api_attributes, on: :create

  def initialize_settings
    shop = self
    shop.settings = {width: 150, border_size: 4, border_color: '#3a4ed1', font_family: 'Helvetica Neue',
      text_color: 'white', bg_color: 'black', button_color: '#38d9c6'}
    shop.save
  end

  def set_api_attributes
    obj = ShopifyAPI::Shop.current
    shop = self
    shop.domain = "https://"+obj.domain
    shop.money_format = obj.money_format.gsub(/<[^>]*>/ui, '')
    shop.save
  end


  #handle_asynchronously :set_api_attributes
  #handle_asynchronously :update_recommendation_snippet
end
