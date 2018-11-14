# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :number, :address, :city, :province_id])
  end

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
