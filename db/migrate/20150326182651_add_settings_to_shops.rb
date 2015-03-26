class AddSettingsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :settings, :hstore
  end
end
