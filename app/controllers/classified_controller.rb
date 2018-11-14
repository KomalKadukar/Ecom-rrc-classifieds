# frozen_string_literal: true

class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.order(updated_at: :desc).page(params[:page]).per(4)
  end

  def show
    @classified = Classified.find(params[:id])
  end

  def results
    key = "%#{params[:query]}%"
    selected_category = "#{params[:category]}"

    if selected_category == 'all'
      @classified_results =
        Classified.where('item LIKE :search OR description LIKE :search', search: key)
    else
      @classified_results =
        Classified.joins(:category).where('name = ?', selected_category)
        .where('item LIKE :search OR description LIKE :search', search: key)
    end

  end
end
