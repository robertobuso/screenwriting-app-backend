class AddColumnStructures < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :order_of_ideas, :text, array:true, default: []
  end
end
