class RemoveOrderFromStructures < ActiveRecord::Migration[5.2]
  def change
    remove_column :structures, :order
    remove_column :structures, :order_of_ideas
  end
end
