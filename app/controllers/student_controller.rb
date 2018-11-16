class StudentController < ApplicationController
  before_action :authenticate_student!

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])

    if(@student.classifieds.count == 0)
      flash[:alert] = "You have no classifieds posted."
      redirect_to root_path
    end
  end
end
