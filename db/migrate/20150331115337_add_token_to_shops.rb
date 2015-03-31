class AddTokenToShops < ActiveRecord::Migration
  def change
    add_column :shops, :token, :string
  end
end
