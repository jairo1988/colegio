class Profesor < ActiveRecord::Base
  before_validation :asigna_nombre_profesor, :if => Proc.new {|profesor|profesor.new_record?}
  has_many :asignaturas
  has_one :user
  has_many :calificaciones
  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :telefono, :presence => true
  validates :oficina, :presence => true
  validates :email, :presence => true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i,  :message => "The correct email format is name@server.com"}
  validates :emailuji, :presence =>true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i, :message => "The correct email format is name@server.com"}
  validates_uniqueness_of :email, :emailuji
  accepts_nested_attributes_for :user

  protected
  def asigna_nombre_profesor
    self.user.name=self.nombre
    self.user.surname=self.apellido
    self.user.email=self.emailuji
  end

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

