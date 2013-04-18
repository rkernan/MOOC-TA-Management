class CreateAnswerResults < ActiveRecord::Migration
  def change
    create_table :answer_results do |t|
      t.boolean :selected
      t.references :question_result
      t.references :answer

      t.timestamps
    end
    add_index :answer_results, :question_result_id
    add_index :answer_results, :answer_id
  end
end
