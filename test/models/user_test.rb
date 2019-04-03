# == Schema Information
#
# Table name: users
#
#  id                    :bigint(8)        not null, primary key
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  email                 :string           not null
#  age                   :integer          not null
#  political_affiliation :string
#  password_digest       :string           not null
#  session_token         :string           not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
