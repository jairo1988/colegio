class Calificacion < ActiveRecord::Base
    validates :nota, :presence => true
    belongs_to :alumno
    belongs_to :asignatura
end
