class Secao < ActiveRecord::Base
    has_many :items
    has_many :subsecaos
    validates :secao, :presence => true,  :uniqueness => true

end
