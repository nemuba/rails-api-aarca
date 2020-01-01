class Sponsor < ApplicationRecord
  paginates_per 5

  validates :name, presence: true
end
