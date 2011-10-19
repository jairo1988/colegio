class Calificacion < ActiveRecord::Base
    validates :nota, :presence => true
    belongs_to :alumno
    belongs_to :asignatura

    validates :asignatura_id,  :uniqueness => { :scope => :alumno_id,
    :message => "No puedes repetir asignatura" }
end
# == Schema Information
#
# Table name: calificaciones
#
#  id            :integer         not null, primary key
#  nota          :decimal(4, 2)
#  created_at    :datetime
#  updated_at    :datetime
#  alumno_id     :integer
#  asignatura_id :integer
#  comentarios   :string(255)
#

