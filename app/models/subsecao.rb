class Subsecao < ActiveRecord::Base
    has_many :items
    belongs_to :secao

    validates :secao, :presence => true
    validates :subsecao, :presence => true,  :uniqueness => true
end
