class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :description
      t.float :price
      t.integer :merchant_id

      t.timestamps
    end
  end
end
