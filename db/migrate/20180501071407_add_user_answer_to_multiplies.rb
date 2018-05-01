class AddUserAnswerToMultiplies < ActiveRecord::Migration[5.0]
  def change
    add_column :multiplies, :user_answer, :integer
  end
end
