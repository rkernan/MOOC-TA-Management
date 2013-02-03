class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :courses, :user_id
  end
end
