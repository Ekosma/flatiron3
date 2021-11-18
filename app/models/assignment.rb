class Assignment < ApplicationRecord
  belongs_to :period
  has_many :grades, dependant: :destroy
end
