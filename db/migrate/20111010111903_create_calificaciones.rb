class CreateCalificaciones < ActiveRecord::Migration
  def change
    create_table :calificaciones do |t|
      t.decimal :nota, :precision=> 4, :scale => 2

      t.timestamps
    end
  end
end
