class CreateSubsecaos < ActiveRecord::Migration
  def change
    create_table :subsecaos do |t|
      t.integer :secao_id
      t.string :subsecao
    end
  end
end
