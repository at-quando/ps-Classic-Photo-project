class AddColumnnToContracta < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :photoshop, :boolean
  ends
end
