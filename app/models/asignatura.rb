class Asignatura < ActiveRecord::Base
  validates :subject, :presence =>true
  validates :profesor, :presence =>true
end
