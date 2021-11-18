class Assignment < ApplicationRecord
  belongs_to :period
  has_many :grades, dependent: :destroy
end
