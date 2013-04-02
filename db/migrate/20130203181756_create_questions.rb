class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :ta_test
      t.text :question
      t.string :question_type
      t.text :answer
      t.text :wrong1
      t.text :wrong2
      t.text :wrong3

      t.timestamps
    end
    add_index :questions, :ta_test_id
  end
end
