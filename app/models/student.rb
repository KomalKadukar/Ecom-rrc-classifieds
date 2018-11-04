class Student < ApplicationRecord
  belongs_to :province
  has_many :classifieds
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true,
            numericality: { only_integer: true },
            length: { is: 7,
              :wrong_length => "Student number should be %{count} digits long." }
  validates :city, presence: true,
            format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, :address, :province, presence: true
end
