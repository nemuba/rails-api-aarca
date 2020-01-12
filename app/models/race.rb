class Race < ApplicationRecord
  include TranslateEnum
  paginates_per 5
  has_many :tests, dependent: :destroy

  validates :local, :description, :date_race, :status,  presence: true
  validates :local, :description, length: { minimum: 5 }

  enum status: {:closed => 0, :open => 1, :finish => 2}

   translate_enum :status
end
