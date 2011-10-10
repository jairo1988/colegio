class Presencium < ActiveRecord::Base
  validate :presentado, :presence=> true
end
