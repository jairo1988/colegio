class AddEmailujiToAlumno < ActiveRecord::Migration
  def change
    add_column :alumnos, :emailuji, :string
  end
end
