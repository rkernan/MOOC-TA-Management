class QuestionResultRemoveCorrect < ActiveRecord::Migration
  def up
    remove_column :question_results, :correct, :boolean
  end

  def down
    add_column :question_results, :correct, :boolean
  end
end
