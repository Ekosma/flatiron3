class User < ApplicationRecord
  has_secure_password
  has_many :periods
  has_many :students
  has_many :assignments, through: :periods
  validates :username, presence: {message: ""}, length: { minimum: 3 } 
  validates :email, uniqueness: { message: "is Invalid" } 
end
