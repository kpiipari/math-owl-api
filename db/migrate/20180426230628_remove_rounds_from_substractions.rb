class RemoveRoundsFromSubstractions < ActiveRecord::Migration[5.0]
  def change
    remove_column :substractions, :round1, :jsonb
    remove_column :substractions, :round2, :jsonb
    remove_column :substractions, :round3, :jsonb
    remove_column :substractions, :round4, :jsonb
    remove_column :substractions, :round5, :jsonb
    remove_column :substractions, :round6, :jsonb
    remove_column :substractions, :round7, :jsonb
    remove_column :substractions, :round8, :jsonb
    remove_column :substractions, :round9, :jsonb
    remove_column :substractions, :round10, :jsonb
    add_column :substractions, :rounds, :jsonb
  end
end
