class AddProfesoridToCalificaciones < ActiveRecord::Migration
  def change
    add_column :calificaciones, :profesor_id, :integer
  end
end
