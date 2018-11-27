# frozen_string_literal: true

class OrderHistoryController < ApplicationController
  def index
    @orders = Order.where(student: current_student)

    @orders.count.zero? &&
      flash[:alert] = 'No orders placed yet.'
  end

  def show
    @order = Order.find(params[:id])
  end
end
