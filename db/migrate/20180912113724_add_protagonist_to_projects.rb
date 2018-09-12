class AddProtagonistToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :protagonist, :string
  end
end
