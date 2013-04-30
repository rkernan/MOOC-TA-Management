class TestResultGrade < ActiveRecord::Migration
  def up
    add_column :test_results, :grade, :decimal
  end

  def down
    remove_column :test_results, :grade, :decimal
  end
end
