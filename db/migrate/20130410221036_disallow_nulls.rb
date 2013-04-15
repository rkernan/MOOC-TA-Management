class DisallowNulls < ActiveRecord::Migration
  def up
    change_table :answers do |t|
      t.change :question_id, :integer, :null => false
      t.change :correct, :boolean, :null => false
      t.change :content, :text, :null => false
    end
    change_table :courses do |t|
      t.change :name, :string, :null => false
      t.change :professor_id, :integer, :null => false
    end
    change_table :questions do |t|
      t.change :ta_test_id, :integer, :null => false
      t.change :content, :text, :null => false
    end
    change_table :ta_tests do |t|
      t.change :course_id, :integer, :null => false
      t.change :name, :string, :null => false
    end
  end

  def down
    change_table :answers do |t|
      t.change :question_id, :integer, :null => true
      t.change :correct, :boolean, :null => true
      t.change :content, :text, :null => true
    end
    change_table :courses do |t|
      t.change :name, :string, :null => true
      t.change :professor_id, :integer, :null => true
    end
    change_table :questions do |t|
      t.change :ta_test_id, :integer, :null => true
      t.change :content, :text, :null => true
    end
    change_table :ta_tests do |t|
      t.change :course_id, :integer, :null => true
      t.change :name, :string, :null => true
    end
  end
end
