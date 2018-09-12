class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :content
      t.string :protagonist
      t.string :antagonist
      t.string :begins
      t.string :ends
      t.integer :act
      t.string :turn
      t.references :projects, foreign_key: true

      t.timestamps
    end
  end
end
