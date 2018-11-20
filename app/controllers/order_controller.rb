# frozen_string_literal: true

class OrderController < ApplicationController
  before_action :authenticate_student!

  def order_summary
    @current_user = current_student
    @province = current_student.province
  end

  def create_order
    @current_order = Order.create(
      student: current_student,
      province_rate: current_student.province.province_rate,
      canada_rate: current_student.province.canada_rate,
      status: Status.find_by(name: 'Pending')
    )

    @cart_classifieds.each do |classified|
      OrderClassified.create(order: @current_order, classified: classified,
                             item_price: classified.price)
    end
  end
end
