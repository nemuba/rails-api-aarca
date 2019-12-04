class Test < ApplicationRecord
  belongs_to :race, required: true
  belongs_to :type_test, required: true

  paginates_per 5
end
