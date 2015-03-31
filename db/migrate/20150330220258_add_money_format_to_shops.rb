class AddMoneyFormatToShops < ActiveRecord::Migration
  def change
    add_column :shops, :money_format, :string
  end
end
