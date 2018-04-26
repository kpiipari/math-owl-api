class AddPlayerIdToSubstractions < ActiveRecord::Migration[5.0]
  def change
    add_column :substractions, :player_id, :integer
  end
end
