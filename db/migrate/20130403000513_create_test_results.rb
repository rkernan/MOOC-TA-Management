class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.string :selected
      t.string :correctness
      t.references :teaching_assistant
      t.references :ta_test

      t.timestamps
    end
    add_index :test_results, :teaching_assistant_id
    add_index :test_results, :ta_test_id
  end
end
