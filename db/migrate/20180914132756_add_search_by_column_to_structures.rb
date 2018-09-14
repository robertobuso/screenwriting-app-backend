class AddSearchByColumnToStructures < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :search_by, :string
  end
end
