class AddPlayerIdToMultiplies < ActiveRecord::Migration[5.0]
  def change
    add_column :multiplies, :player_id, :integer
  end
end
