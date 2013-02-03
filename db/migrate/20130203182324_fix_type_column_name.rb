class FixTypeColumnName < ActiveRecord::Migration
  def up
      rename_column :questions, :type, :question_type
  end

  def down
  end
end
