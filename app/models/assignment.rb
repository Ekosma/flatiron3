class Assignment < ApplicationRecord
  has_many :students
  belongs_to :period
end
