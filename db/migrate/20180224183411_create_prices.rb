class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :num_pp
      t.float :price
      t.integer :num_pg

      t.timestamps
    end
  end
end
