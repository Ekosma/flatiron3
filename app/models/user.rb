class User < ApplicationRecord
  has_secure_password
  has_many :periods
  has_many :students
  has_many :assignments, through: :periods
end
