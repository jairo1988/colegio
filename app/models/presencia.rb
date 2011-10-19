class Presencia < ActiveRecord::Base
  validate :presentado, :presence=> true
end
# == Schema Information
#
# Table name: presencias
#
#  id         :integer         not null, primary key
#  presentado :string(255)
#  created_at :datetime
#  updated_at :datetime
#

