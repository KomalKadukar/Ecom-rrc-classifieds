class Province < ApplicationRecord
  has_many :students

  validates :name, :code, presence: true, uniqueness: true
  validates :rate_type, presence: true
  validates :province_rate, :canada_rate, presence:true,
            numericality: { :greater_than_or_equal_to => 0 }
end
