class StudentPeriod < ApplicationRecord
  belongs_to :student
  belongs_to :period
end
