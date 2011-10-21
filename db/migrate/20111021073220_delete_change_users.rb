class DeleteChangeUsers < ActiveRecord::Migration
  def up
    remove_column :users, :surname
    rename_column :users, :name, :username
    remove_column :users, :tipo
  end
  def down
    add_column :users, :surname
    rename_column :users, :username, :name
    add_column :users, :tipo
  end
end
