class Alumno < ActiveRecord::Base
  validates :name, :presence => true
  validates :apellido, :presence => true
end
