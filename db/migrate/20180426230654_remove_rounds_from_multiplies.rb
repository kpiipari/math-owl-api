class RemoveRoundsFromMultiplies < ActiveRecord::Migration[5.0]
  def change
    remove_column :multiplies, :round1, :jsonb
    remove_column :multiplies, :round2, :jsonb
    remove_column :multiplies, :round3, :jsonb
    remove_column :multiplies, :round4, :jsonb
    remove_column :multiplies, :round5, :jsonb
    remove_column :multiplies, :round6, :jsonb
    remove_column :multiplies, :round7, :jsonb
    remove_column :multiplies, :round8, :jsonb
    remove_column :multiplies, :round9, :jsonb
    remove_column :multiplies, :round10, :jsonb
    add_column :multiplies, :rounds, :jsonb
  end
end
