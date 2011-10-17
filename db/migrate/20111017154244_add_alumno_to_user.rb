class AddAlumnoToUser < ActiveRecord::Migration
  def change
    add_column :alumnos, :alumno_id, :string
  end
end
