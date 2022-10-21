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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :validatable

  belongs_to :company

  PROFILE_FIELDS = %i[name age dob bio phone address city zip country].freeze

end
