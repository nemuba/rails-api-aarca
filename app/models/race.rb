class Race < ApplicationRecord
  paginates_per 5
  has_many :tests, dependent: :destroy

  validates :local, :description, :date_race, presence: true
  validates :local, :description, length: { minimum: 5 }
end
