class Asignatura < ActiveRecord::Base
  validates :asignatura, :presence =>true
  validates :profesor_id, :presence =>true


  has_many :calificaciones, :dependent => :restrict #:destroy :nulify
  belongs_to :profesor
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

