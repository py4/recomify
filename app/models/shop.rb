class Shop < ActiveRecord::Base
  store_accessor :settings

  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy
  
  after_initialize :set_settings 
  after_create :set_additional_data

  def self.store(session)
     shop = Shop.new(domain: session.url, token: session.token)
     shop.save!
     shop.id
   end

   def self.retrieve(id)
     if shop = Shop.where(id: id).first
       ShopifyAPI::Session.new(shop.domain, shop.token)
     end
   end

  def set_settings
    return if self.settings
    self.settings = {width: 200, border_size: 4, border_color: '#3a4ed1', font_family: 'Helvetica Neue',
      text_color: '#000000', bg_color: '#a7ccaa', button_color: '#38d9c6'}
  end

  def set_additional_data
    Resque.enqueue(ShopAdditionalAttributesSetter, id)
  end
  
end
