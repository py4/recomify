class AddShopRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :shop, index: true
    add_foreign_key :customers, :shops
  end
end
