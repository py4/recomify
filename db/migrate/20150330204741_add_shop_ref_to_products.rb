class AddShopRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :shop, index: true
    add_foreign_key :products, :shops
  end
end
