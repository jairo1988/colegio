class Alumno < ActiveRecord::Base
  has_many :calificaciones
  has_many :asignaturas, :through => :calificaciones
  has_one :user

  validates :name, :presence => true
  validates :apellido, :presence => true



  #TODO: Mostrar solo las que el alumno no tiene
  def asignaturas_restantes
    ids = Asignatura.all.map{|a| a.id}
    ids_a_eliminar = asignaturas.map{|a| a.id}
    ids_a_mostrar = ids - ids_a_eliminar
    Asignatura.find(ids_a_mostrar)
  end
end
