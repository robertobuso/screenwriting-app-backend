class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.references :projects, foreign_key: true
      t.boolean :saved
      t.string :title

      t.timestamps
    end
  end
end
