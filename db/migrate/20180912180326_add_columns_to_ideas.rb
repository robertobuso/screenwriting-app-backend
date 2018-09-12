class AddColumnsToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :description, :string
    add_column :ideas, :conflict, :string
    add_column :ideas, :miscellaneous, :string
    add_column :ideas, :research, :string
    add_column :ideas, :inspiration, :string
  end
end
