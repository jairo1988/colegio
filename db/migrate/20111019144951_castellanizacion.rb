class Castellanizacion < ActiveRecord::Migration
  def change
    rename_column(:alumnos,:name,:nombre)
    rename_column(:profesors,:name,:nombre)
    rename_column(:asignaturas,:subject,:asignatura)
    rename_column(:asignaturas,:office,:oficina)
    rename_column(:asignaturas,:telephone,:telefono)
    rename_column(:profesors,:office,:oficina)
    rename_column(:profesors,:telephone,:telefono)
    rename_table(:profesors,:profesores)
  end
end
