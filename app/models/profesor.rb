class Profesor < ActiveRecord::Base
  has_many :asignaturas
  has_one :user, :as => :logable
  has_many :calificaciones
  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :telefono, :presence => true
  validates :oficina, :presence => true
  validates :email, :presence => true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i,  :message => "The correct email format is name@server.com"}
  validates_uniqueness_of :email, :emailuji
  accepts_nested_attributes_for :user, :reject_if => :all_blank


end
# == Schema Information
#
# Table name: profesors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  apellido   :string(255)
#  email      :string(255)
#  emailuji   :string(255)
#  office     :string(255)
#  telephone  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

