class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :name
      t.text :description
      t.string :url
      t.string :price

      t.timestamps null: false
    end
  end
end
