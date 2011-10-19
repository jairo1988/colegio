class CreateProfesors < ActiveRecord::Migration
  def change
    create_table :profesors do |t|
      t.string :name
      t.string :apellido
      t.string :email
      t.string :emailuji
      t.string :office
      t.string :telephone

      t.timestamps
    end
  end
end
