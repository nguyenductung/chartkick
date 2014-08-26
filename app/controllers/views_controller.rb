class ViewsController < ApplicationController
  before_action :set_objects

  def index
    @views = View.paginate(page: params[:page], per_page: 50)
  end

  def total_views
  end

  def views_per_day
  end

  def average_duration
  end

  private
  def set_objects
    @views = View.all
  end
end
