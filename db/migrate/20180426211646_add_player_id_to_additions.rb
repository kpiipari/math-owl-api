class AddPlayerIdToAdditions < ActiveRecord::Migration[5.0]
  def change
    add_column :additions, :player_id, :integer
  end
end
