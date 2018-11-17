# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart_classifieds

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

  def initialize_session
    session[:cart] ||= 0
    session[:cart_items] ||= []
  end

  def current_cart_classifieds
    @cart_classifieds = Classified.find(session[:cart_items])
  end

  helper_method :programs
  helper_method :categories
end
