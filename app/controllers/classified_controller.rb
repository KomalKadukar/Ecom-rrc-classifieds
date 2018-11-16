# frozen_string_literal: true

class ClassifiedController < ApplicationController
  def index
    @classifieds = Classified.order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    @classified = Classified.find(params[:id])
  end

  # Finds classified within selected category
  def results
    key = "%#{params[:query]}%"
    # selected_category = "#{params[:category]}".to_s
    selected_category = params[:category].to_s

    if(key.present?)
      redirect_to root_path
    end

    if selected_category == 'all'
      @classified_results =
        Classified.where('item LIKE :search OR description LIKE :search', search: key)
    else
      @classified_results =
        Classified.joins(:category).where('name = ?', selected_category)
                  .where('item LIKE :search OR description LIKE :search', search: key)
    end
  end

  # Gets classifieds newly added in last 24 hours
  def newly_added
    current_time = Time.now
    @classifieds_added = Classified.where(created_at: (current_time - 24.hours)..current_time)

    if(@classifieds_added.count == 0)
      flash[:alert] = "There are no new classifieds posted."
      redirect_to root_path
    end
  end

  # Gets classifieds updated in last 24 hours
  def recently_updated
    current_time = Time.now
    @classifieds_updated = Classified.where(updated_at: (current_time - 24.hours)..current_time)
                                     .where.not(created_at: (current_time - 24.hours)..current_time)

    if(@classifieds_updated.count == 0)
      flash[:alert] = "There are no recently updated classifieds posted."
      redirect_to root_path
    end
  end
end
