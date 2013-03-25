class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :ta_test
      t.text :question
      t.string :question_type
      t.text :answer

      t.timestamps
    end
    add_index :questions, :ta_test_id
  end
end
