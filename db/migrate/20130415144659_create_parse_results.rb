class CreateParseResults < ActiveRecord::Migration
  def change
    create_table :parse_results do |t|
      t.integer :fog
      t.boolean :pending
      t.integer :professor_id
      t.integer :ta_id
      t.integer :activity

      t.timestamps
    end
  end
end
