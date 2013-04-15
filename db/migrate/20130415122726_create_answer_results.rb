class CreateAnswerResults < ActiveRecord::Migration
  def change
    create_table :answer_results do |t|
      t.boolean :correct
      t.boolean :selected
      t.references :question_result

      t.timestamps
    end
    add_index :answer_results, :question_result_id
  end
end
