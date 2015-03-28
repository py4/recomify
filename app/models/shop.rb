class Shop < ActiveRecord::Base
  acts_as_singleton
  store_accessor :settings

  has_many :customers, dependent: :destroy
  after_create :initialize_settings

  private
  def initialize_settings
    shop = self
    shop.settings = {width: 150, border_size: 4, border_color: '#3a4ed1', font_family: 'Helvetica Neue',
      text_color: 'white', bg_color: 'black', button_color: '#38d9c6'}
    shop.domain = "https://"+ShopifyAPI::Shop.current.domain
    shop.save
  end
end
