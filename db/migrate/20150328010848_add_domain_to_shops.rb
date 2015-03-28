class AddDomainToShops < ActiveRecord::Migration
  def change
    add_column :shops, :domain, :string
  end
end
