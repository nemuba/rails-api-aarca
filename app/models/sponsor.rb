class Sponsor < ApplicationRecord
  paginates_per 5
  has_many :races
  validates :name, presence: true
end
