class CreatePresencia < ActiveRecord::Migration
  def change
    create_table :presencia do |t|
      t.string :presentado

      t.timestamps
    end
  end
end
