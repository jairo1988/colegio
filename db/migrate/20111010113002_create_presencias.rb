class CreatePresencias < ActiveRecord::Migration
  def change
    create_table :presencias do |t|
      t.string :presentado

      t.timestamps
    end
  end
end
