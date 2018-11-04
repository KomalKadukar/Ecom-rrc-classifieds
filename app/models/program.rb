class Program < ApplicationRecord
  has_many :program_classifieds
  has_many :classifieds, through: :program_classifieds

  validates :name, presence: true, uniqueness: true
end
