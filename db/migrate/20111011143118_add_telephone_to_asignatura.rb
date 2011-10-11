class AddTelephoneToAsignatura < ActiveRecord::Migration
  def change
    add_column :asignaturas, :telephone, :string
    add_column :asignaturas, :email, :string
  end
end
