class Asignatura < ActiveRecord::Base
  validates :subject, :presence =>true
  validates :profesor, :presence =>true
  #validates :profesor_id


  has_many :calificaciones
  belongs_to :profesores
end
# == Schema Information
#
# Table name: asignaturas
#
#  id          :integer         not null, primary key
#  subject     :string(255)
#  profesor    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  office      :string(255)
#  telephone   :string(255)
#  email       :string(255)
#  profesor_id :integer
#

