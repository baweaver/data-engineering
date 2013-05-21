class RemoveDealsidFromDealsAddToReceipt < ActiveRecord::Migration
  def up
   remove_column :deals, :deal_id
   add_column :receipts, :deal_id, :integer
  end

  def down
  end
end
