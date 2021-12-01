class Student < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :periods
  has_many :grades, dependent: :destroy
  has_many :assignments, through: :grades
  
  validates :student_name, presence: true
  scope :alpha, -> { order(:student_name) }
end
