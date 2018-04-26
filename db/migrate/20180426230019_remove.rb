class Remove < ActiveRecord::Migration[5.0]
  def change
    remove_column :additions, :round1, :jsonb
    remove_column :additions, :round2, :jsonb
    remove_column :additions, :round3, :jsonb
    remove_column :additions, :round4, :jsonb
    remove_column :additions, :round5, :jsonb
    remove_column :additions, :round6, :jsonb
    remove_column :additions, :round7, :jsonb
    remove_column :additions, :round8, :jsonb
    remove_column :additions, :round9, :jsonb
    remove_column :additions, :round10, :jsonb
    add_column :additions, :rounds, :jsonb
  end
end
