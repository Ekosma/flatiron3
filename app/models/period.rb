class Period < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :assignments
  has_many :grades, through: :assignments

  validates :period_name, presence: true, length: { minimum: 3 }
end
