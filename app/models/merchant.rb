class Merchant < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :deals
end
