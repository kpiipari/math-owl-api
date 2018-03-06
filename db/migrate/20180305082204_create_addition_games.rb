class CreateAdditionGames < ActiveRecord::Migration[5.0]
  def change
    create_table :addition_games do |t|
      t.jsonb :rounds
      t.integer :score
      t.time :time

      t.timestamps
    end
  end
end
