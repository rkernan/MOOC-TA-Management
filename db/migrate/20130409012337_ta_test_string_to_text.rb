class TaTestStringToText < ActiveRecord::Migration
  def up
    remove_column :questions, :content, :string
    add_column :questions, :content, :text
    remove_column :answers, :content, :string
    add_column :answers, :content, :text
  end

  def down
    remove_column :questions, :content, :text
    add_column :questions, :content, :string
    remove_column :answers, :content, :text
    add_column :answers, :content, :string
  end
end
