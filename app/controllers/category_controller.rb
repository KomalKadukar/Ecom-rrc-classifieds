# frozen_string_literal: true

class CategoryController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
  end
end
