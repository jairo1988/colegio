class AddAlumnoToUser < ActiveRecord::Migration
  def change
    add_column :users, :alumno_id, :integer
  end
end
