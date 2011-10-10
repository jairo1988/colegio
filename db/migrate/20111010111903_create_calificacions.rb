class CreateCalificacions < ActiveRecord::Migration
  def change
    create_table :calificacions do |t|
      t.float :nota

      t.timestamps
    end
  end
end
