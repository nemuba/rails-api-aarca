class TypeTest < ApplicationRecord
  paginates_per 5
  has_many :tests, dependent: :destroy
  validates :genre, :oar, presence: true
end
