class TypeTest < ApplicationRecord
  paginates_per 5
  has_many :type_tests
  validates :genre, :oar, presence: true
end
