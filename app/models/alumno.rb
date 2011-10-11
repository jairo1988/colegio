class Alumno < ActiveRecord::Base
  has_many :calificaciones
  has_many :asignaturas, :through => :calificaciones

  validates :name, :presence => true
  validates :apellido, :presence => true
end
