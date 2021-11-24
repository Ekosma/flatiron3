class Student < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :periods
  has_many :grades, dependent: :destroy
  has_many :assignments, through: :grades

  scope :alpha, -> { order(:student_name) }
end
