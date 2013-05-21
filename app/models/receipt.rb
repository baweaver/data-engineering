class Receipt < ActiveRecord::Base
  attr_accessible :customer_id, :deal_id, :quantity
  belongs_to :customer
  has_one :deal
end
