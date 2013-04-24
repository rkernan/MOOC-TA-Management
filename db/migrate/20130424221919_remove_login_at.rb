class RemoveLoginAt < ActiveRecord::Migration
  def up
    remove_column :users, :first_login_at, :datetime
    remove_column :users, :last_login_at, :datetime
  end

  def down
    add_column :users, :first_login_at, :datetime
    add_column :users, :last_login_at, :datetime
  end
end
