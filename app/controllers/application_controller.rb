# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def programs
    @programs = Program.all
  end

  helper_method :programs
end
