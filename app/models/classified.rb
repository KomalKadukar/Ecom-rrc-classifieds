class Classified < ApplicationRecord
  belongs_to :category
  belongs_to :student
end
