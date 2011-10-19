require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  name          :string(255)
#  surname       :string(255)
#  tipo          :string(255)
#  admin         :boolean         default(FALSE)
#  alumno_id     :integer
#  profesor_id   :integer
#

