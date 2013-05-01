class FixParseResults < ActiveRecord::Migration
  def change
    create_table :parse_results do |t|
      t.string "name"
      t.integer "user_id"
      t.integer "activity"
      t.integer "fog"
      t.integer "kincaid"
      t.integer "flesch"
      t.string "course_path"
      t.integer "ta_id"
    end
  end
end
