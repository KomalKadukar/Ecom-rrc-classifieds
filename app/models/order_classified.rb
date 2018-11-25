# frozen_string_literal: true

class OrderClassified < ApplicationRecord
  belongs_to :order
  belongs_to :classified

  validates :order, :classified, presence: true
end
