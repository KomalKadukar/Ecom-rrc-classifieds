# frozen_string_literal: true

class OrderController < ApplicationController
  before_action :authenticate_student!
  before_action :finalize_taxes
  before_action :rate_type

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

  private

  def finalize_taxes
    @sub_total = @cart_classifieds.collect { |item| item.valid? ? item.price : 0 }.sum

    @taxrate = current_student.province.province_rate +
               current_student.province.canada_rate

    @total_tax = @sub_total * @taxrate

    @grand_total = @sub_total + @total_tax
  end

  def rate_type
    @rates = {}
    current_student.province.rate_type.split('+').map { |rt|
      @rates[rt] =
        rt == 'GST' ? current_student.province.canada_rate : current_student.province.province_rate
    }
  end
end
