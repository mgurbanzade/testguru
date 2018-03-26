class AddReferenceAndColumnToTestPassage < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_passages, :current_question, foreign_key: true
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
