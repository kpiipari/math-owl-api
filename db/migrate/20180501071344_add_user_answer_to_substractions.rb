class AddUserAnswerToSubstractions < ActiveRecord::Migration[5.0]
  def change
    add_column :substractions, :user_answer, :integer
  end
end
