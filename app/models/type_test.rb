class TypeTest < ApplicationRecord
  paginates_per 5

  validates :genre, :oar, presence: true
end
