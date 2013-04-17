class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      t.boolean :correct
      t.references :test_result
      t.references :question

      t.timestamps
    end
    add_index :question_results, :test_result_id
    add_index :question_results, :question_id
  end
end
