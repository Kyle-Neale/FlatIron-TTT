class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :game_id
      t.boolean :nought

      t.timestamps
    end
  end
end
