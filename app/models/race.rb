class Race < ApplicationRecord
  paginates_per 5

  validates :local, :description, :date_race, presence: true
end
