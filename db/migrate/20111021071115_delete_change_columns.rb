class DeleteChangeColumns < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :alumnos, :emailuji
    add_column :users, :emailuji, :string
  end
end
