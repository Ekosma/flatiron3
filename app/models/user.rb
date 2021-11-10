class User < ApplicationRecord
  has_secure_password
  has_many :periods
  has_many :students, through: :periods
  has_many :assignments, through: :periods
end
