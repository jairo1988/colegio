class AddAsignaturasProfesorId < ActiveRecord::Migration
  def change
    add_column :asignaturas, :profesor_id, :integer
  end
end
