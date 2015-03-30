class RemoveProductIdFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :product_id, :string
    remove_column :recommendations, :product_name, :string
    remove_column :recommendations, :product_url, :string
  end
end
