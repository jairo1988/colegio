class Profesor < ActiveRecord::Base
  before_validation :asigna_nombre_profesor, :if => Proc.new {|profesor|profesor.new_record?}
  has_many :asignaturas,  :through => :calificaciones
  has_one :user
  validates :name, :presence => true
  validates :apellido, :presence => true
  validates :telephone, :presence => true
  validates :office, :presence => true
  validates :email, :presence => true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i,  :message => "The correct email format is name@server.com"}
  validates :emailuji, :presence =>true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i, :message => "The correct email format is name@server.com"}
  validates_uniqueness_of :email, :emailuji
  accepts_nested_attributes_for :user

  protected
  def asigna_nombre_profesor
    self.user.name=self.name
    self.user.surname=self.apellido
    self.user.email=self.emailuji
  end

end
