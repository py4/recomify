class AddProductRefToRecommendations < ActiveRecord::Migration
  def change
    add_reference :recommendations, :product, index: true
    add_foreign_key :recommendations, :products
  end
end
