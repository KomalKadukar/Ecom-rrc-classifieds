# frozen_string_literal: true

class Program < ApplicationRecord
  has_many :program_classifieds, dependent: :destroy
  has_many :classifieds, through: :program_classifieds

  validates :name, presence: true, uniqueness: true
end
