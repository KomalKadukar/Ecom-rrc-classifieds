class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.all
  end

  def show
    @classified = Classified.find(params[:id])
  end
end
