class AddComentarioToAsignatura < ActiveRecord::Migration
  def change
    add_column :calificaciones, :comentarios, :string
  end
end
