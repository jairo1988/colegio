class Calificacion < ActiveRecord::Base
    validates :nota, :presence => true
    belongs_to :alumno
    belongs_to :asignatura

    validates :asignatura_id,  :uniqueness => { :scope => :alumno_id,
    :message => "No puedes repetir asignatura" }
end
