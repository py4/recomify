class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :customer, index: true
      t.string :email
      t.text :comment
      t.string :product_id
      t.string :product_name
      t.string :product_url

      t.timestamps null: false
    end
    add_foreign_key :recommendations, :customers
  end
end
