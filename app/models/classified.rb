class Classified < ApplicationRecord
  belongs_to :category
  belongs_to :student

  has_many :program_classifieds
  has_many :programs, through: :program_classifieds

  validates :item, :description, :category, :student, presence: true
  validates :admin_ad, :sold, inclusion: { in: [true, false] }
  validates :price, presence: true, numericality: { :greater_than => 0 }
end
