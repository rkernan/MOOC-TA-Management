class UserUniquenessAndNulls < ActiveRecord::Migration
  def up
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
    remove_column :users, :username, :string
    remove_column :users, :password, :string
    change_table :users do |t|
      t.change :email, :string, { :unique => true, :null => false }
      t.change :password_hash, :string, { :null => false }
      t.change :password_salt, :string, { :null => false }
    end
  end

  def down
    remove_column :users, :password_hash, :string
    remove_column :users, :password_salt, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
    change_table :users do |t|
      t.change :email, :string, { :unique => false, :null => :true }
    end
  end
end
