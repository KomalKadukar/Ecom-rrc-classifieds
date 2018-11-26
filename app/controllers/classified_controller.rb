# frozen_string_literal: true

class ClassifiedController < ApplicationController
  # before_action :authenticate_student!, except: [:show, :index, :results,
  #                                                :newly_added, :recently_updated]

  def index
    @classifieds = Classified.where(sold: [nil, false])
                             .order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    @classified = Classified.find(params[:id])
  end

  # Finds classified within selected category
  def results
    key = "%#{params[:query]}%"
    selected_category = params[:category].to_s

    # if (key.empty?)
    # redirect_to root_path
    # end

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
    current_time = Time.current
    @classifieds_added = Classified.where(created_at: (current_time - 24.hours)..current_time)

    @classifieds_added.count.zero? &&
      flash[:alert] = 'There are no new classifieds posted.'

    # redirect_to root_path
  end

  # Gets classifieds updated in last 24 hours
  def recently_updated
    current_time = Time.current
    @classifieds_updated =
      Classified.where(updated_at: (current_time - 24.hours)..current_time)
                .where.not(created_at: (current_time - 24.hours)..current_time)
                .where(sold: [nil, false])

    # if @classifieds_updated.count.zero?
    #   flash[:alert] = 'There are no recently updated classifieds posted.'
    #   redirect_to root_path
    # end

    @classifieds_updated.count.zero? &&
      flash[:alert] = 'There are no recently updated classifieds posted.'

    # redirect_to root_path
  end

  def add_to_cart
    id = params[:id].to_i
    # unless session[:cart_items].include?(id)
    # session[:cart_items] << id unless session[:cart_items].include?(id)
    # end
    !session[:cart_items].include?(id) && session[:cart_items] << id
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart_items].include?(id) && session[:cart_items].delete(id)
    # if session[:cart_items].include?(id)
    #   session[:cart_items].delete(id)
    # end
    redirect_to root_path
  end

  def clear_the_cart
    session[:cart_items] = []
    redirect_to root_path
  end
end
