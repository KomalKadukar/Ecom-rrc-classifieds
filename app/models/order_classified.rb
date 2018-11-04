class OrderClassified < ApplicationRecord
  belongs_to :order
  belongs_to :classified
end
