class AddShopRefToRecommendations < ActiveRecord::Migration
  def change
    add_reference :recommendations, :shop, index: true
    add_foreign_key :recommendations, :shops
  end
end
