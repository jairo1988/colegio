class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :name
      t.string :apellido

      t.timestamps
    end
  end
end
