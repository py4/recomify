class AddIndexToCustomers < ActiveRecord::Migration
  def change
    add_index :customers, :email
    add_index :customers, :customer_id
  end
end
