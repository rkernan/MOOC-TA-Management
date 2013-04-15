class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      t.boolean :correct
      t.references :test_result

      t.timestamps
    end
    add_index :question_results, :test_result_id
  end
end
