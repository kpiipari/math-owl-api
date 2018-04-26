class CreateSubstractions < ActiveRecord::Migration[5.0]
  def change
    create_table :substractions do |t|
      t.integer :score
      t.time :time
      t.jsonb :round1
      t.jsonb :round2
      t.jsonb :round3
      t.jsonb :round4
      t.jsonb :round5
      t.jsonb :round6
      t.jsonb :round7
      t.jsonb :round8
      t.jsonb :round9
      t.jsonb :round10

      t.timestamps
    end
  end
end
