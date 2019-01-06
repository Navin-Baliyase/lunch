class Place < ApplicationRecord
  belongs_to :employee
  validates_presence_of :proposed_place
end
