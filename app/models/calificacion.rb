class Calificacion < ActiveRecord::Base
    validates :nota, :presence => true
    validates :nota, :numericality =>{:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}
    belongs_to :alumno
    belongs_to :asignatura
    belongs_to :profesor
    #validates_uniqueness_of :asignatura_id,  :scope => :alumno_id #, :message => "No puedes repetir asignatura"
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

