class AddQuestionNumberToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :question_number, :integer, default: 1
  end
end
