class AddReferencesToCalificaciones < ActiveRecord::Migration
  def change
    add_column :calificaciones, :alumno_id, :integer
    add_column :calificaciones, :asignatura_id, :integer
  end
end
