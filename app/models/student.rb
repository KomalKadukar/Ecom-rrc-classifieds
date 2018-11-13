# frozen_string_literal: true

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province
  has_many :classifieds, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :number,  presence: true, uniqueness: true,
                      numericality: { only_integer: true },
                      length: { is: 7,
                                wrong_length: 'Student number should be %{count} digits long.' }
  validates :city,  presence: true,
                    format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :email, :address, :province, presence: true
end
