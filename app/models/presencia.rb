class Presencia < ActiveRecord::Base
  validate :presentado, :presence=> true
end
