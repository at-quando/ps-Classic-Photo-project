class AddColumnInboxToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :inbox, :photoshop, :boolean
  end
end
