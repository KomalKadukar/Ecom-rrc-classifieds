# frozen_string_literal: true

class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.order(updated_at: :desc).page(params[:page]).per(4)
  end

  def show
    @classified = Classified.find(params[:id])
  end
end
