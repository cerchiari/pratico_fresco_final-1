class CreateSecaos < ActiveRecord::Migration
  def change
    create_table :secaos do |t|
      t.string :secao
    end
  end
end
