class AddProfesoridToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profesor_id, :integer
  end
end
