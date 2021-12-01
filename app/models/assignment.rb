class Assignment < ApplicationRecord
  belongs_to :period
  has_many :grades, dependent: :destroy
  validates :assignment_name, presence: {message: ""}, length: { minimum: 3 } 
end
