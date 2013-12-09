class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :secao_id
      t.integer :subsecao_id
      t.string :item
      t.string :marca
      t.text :descricao
      t.float :preco
      t.string :imagem
    end
  end
end
