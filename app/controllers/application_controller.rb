# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def programs
    @programs = Program.all
  end

  def categories
    @categories = Category.all
  end

  helper_method :programs
  helper_method :categories
end
