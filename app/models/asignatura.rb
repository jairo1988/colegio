class Asignatura < ActiveRecord::Base
  validates :subject, :presence =>true
  validates :profesor, :presence =>true
  #validates :profesor_id


  has_many :calificaciones
  belongs_to :profesores
end
