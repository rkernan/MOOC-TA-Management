class CourseProfessorId < ActiveRecord::Migration
  def up
    remove_column :courses, :user_id, :integer
    add_column :courses, :professor_id, :integer
  end

  def down
    remove_column :courses, :professor_id, :integer
    add_column :courses, :user_id, :integer
  end
end
