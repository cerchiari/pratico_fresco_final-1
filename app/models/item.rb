class Item < ActiveRecord::Base
  belongs_to :secao
  belongs_to :subsecao

  validates :secao, :presence => true
  validates :item, :presence => true, :uniqueness => true
  validates :preco, :presence => true, :numericality=> true
  
  
end
