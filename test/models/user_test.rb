# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint           not null
#  name                   :string
#  bio                    :text
#  age                    :integer
#  dob                    :date
#  country                :string
#  city                   :string
#  zip                    :string
#  address                :string
#  phone                  :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "name" do
    assert_equal "Accountant", users(:accountant).name
  end
end
