class Calificacion < ActiveRecord::Base
  validates :nota, :presence => true
end
