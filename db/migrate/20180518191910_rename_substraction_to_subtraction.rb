class RenameSubstractionToSubtraction < ActiveRecord::Migration[5.0]
  def change
    rename_table :substractions, :subtractions
  end
end
