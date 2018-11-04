class Category < ApplicationRecord
  has_many :classifieds

  validates :name, presence: true, uniqueness: true
end
