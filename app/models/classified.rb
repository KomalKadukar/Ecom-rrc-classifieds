# frozen_string_literal: true

class Classified < ApplicationRecord
  belongs_to :category
  belongs_to :student

  has_many :program_classifieds, dependent: :destroy
  has_many :programs, through: :program_classifieds
  accepts_nested_attributes_for :program_classifieds, allow_destroy: true

  has_many :order_classifieds, dependent: :destroy
  has_many :orders, through: :order_classifieds

  validates :item, :description, :category, :student, presence: true
  validates :admin_ad, :sold, inclusion: { in: [true, false] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :image, ImageUploader
end
