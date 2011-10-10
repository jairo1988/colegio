class CreateAsignaturas < ActiveRecord::Migration
  def change
    create_table :asignaturas do |t|
      t.string :subject
      t.string :profesor

      t.timestamps
    end
  end
end
