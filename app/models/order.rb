# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :status
  belongs_to :student
  has_many :order_classifieds, dependent: :destroy
  has_many :classifieds, through: :order_classifieds

  validates :order_amount, :province_rate, :canada_rate, presence: true
  validates :status, :student, presence: true
end
