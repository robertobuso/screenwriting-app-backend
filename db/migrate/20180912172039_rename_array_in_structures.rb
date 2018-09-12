class RenameArrayInStructures < ActiveRecord::Migration[5.2]
  def change
    rename_column :structures, :array, :order
  end
end
