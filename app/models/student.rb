class Student < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :classes
end
