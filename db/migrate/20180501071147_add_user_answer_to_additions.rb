class AddUserAnswerToAdditions < ActiveRecord::Migration[5.0]
  def change
    add_column :additions, :user_answer, :integer
  end
end
