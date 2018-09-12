class AddArrayColumnStructures < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :array, :jsonb, array:true, default: []
  end
end
