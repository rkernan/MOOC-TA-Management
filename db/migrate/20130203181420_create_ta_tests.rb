class CreateTaTests < ActiveRecord::Migration
  def change
    create_table :ta_tests do |t|
      t.references :course
      t.string :name

      t.timestamps
    end
    add_index :ta_tests, :course_id
  end
end
