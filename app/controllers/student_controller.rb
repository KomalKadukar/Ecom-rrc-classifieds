# frozen_string_literal: true

class StudentController < ApplicationController
  before_action :authenticate_student!

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])

    @student.classifieds.count.zero? &&
      flash[:alert] = 'You have no classifieds listed.'

    # redirect_to root_path
  end
end
