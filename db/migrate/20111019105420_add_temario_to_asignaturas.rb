class AddTemarioToAsignaturas < ActiveRecord::Migration
  def change
    add_column :asignaturas, :temario, :string
    add_column :asignaturas, :diaexamen, :datetime
    add_column :asignaturas, :horaexamen, :datetime
  end
end
