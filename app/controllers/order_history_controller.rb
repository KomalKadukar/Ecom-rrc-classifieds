# frozen_string_literal: true

class OrderHistoryController < ApplicationController
  def index
    @orders = Order.where(student: current_student)
  end

  def show
    @order = Order.find(params[:id])
  end
end
