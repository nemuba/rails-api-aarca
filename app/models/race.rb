class Race < ApplicationRecord
  paginates_per 5
  has_many :tests
  validates :local, :description, :date_race, presence: true
end
