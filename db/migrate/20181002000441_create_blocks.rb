class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.integer :row
      t.integer :column
      t.boolean :nought
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
