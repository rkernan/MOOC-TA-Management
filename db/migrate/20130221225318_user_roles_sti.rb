class UserRolesSti < ActiveRecord::Migration
  def up
    add_column :users, :type, :string
  end

  def down
    remove_column :users, :type, :string
  end
end
