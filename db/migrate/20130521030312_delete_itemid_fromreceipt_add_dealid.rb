class DeleteItemidFromreceiptAddDealid < ActiveRecord::Migration
  def up
    remove_column :deals, :item_id
    add_column :deals, :deal_id, :integer
  end

  def down
  end
end
