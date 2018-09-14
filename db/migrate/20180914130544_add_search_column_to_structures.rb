class AddSearchColumnToStructures < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :search, :boolean
  end
end
