class StudentController < ApplicationController
  before_action :authenticate_student!

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
end
