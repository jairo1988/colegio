class AddOfficeToAsignatura < ActiveRecord::Migration
  def change
     add_column :asignaturas, :office, :string
  end
end
