class Order < ActiveRecord::Base
  belongs_to :user
  has_many :purchases
  has_many :items, :through => :purchases

end
