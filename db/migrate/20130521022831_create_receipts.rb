class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :customer_id

      t.timestamps
    end
  end
end
