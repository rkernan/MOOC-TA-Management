class UserPersistenceToken < ActiveRecord::Migration
  def up
    add_column :users, :persistence_token, :string
  end

  def down
    remove_column :users, :persistence_token, :string
  end
end
