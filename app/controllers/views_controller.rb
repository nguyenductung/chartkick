class ViewsController < ApplicationController
  def index
    @views = View.paginate(page: params[:page], per_page: 50)
  end

  [:os, :browser, :country, :day].each do |label|
    define_method("views_by_#{label.to_s}") do
      if label == :day
        data = View.group_by_day(:created_at, format: "%B %d, %Y").count
      else
        data = View.group(label).order(label).count
      end
      render json: data
    end

    define_method("average_duration_by_#{label.to_s}") do
      if label == :day
        data = View.group_by_day(:created_at, format: "%B %d, %Y").average(:duration)
          .map{|d| [d[0], d[1].to_f.round(2)]}
      else
        data = View.group(label).order(label).average(:duration)
          .map{|d| [d[0], d[1].to_f.round(2)]}
      end
      render json: data
    end

    define_method("duration_by_#{label.to_s}") do
      data = [:maximum, :minimum].map do |m|
        if label == :day
          {name: m.to_s, data: View.group_by_day(:created_at, format: "%B %d, %Y").send(m, :duration)}
        else
          {name: m.to_s, data: View.group(label).order(label).send(m, :duration)}
        end
      end
      render json: data.chart_json
    end

    next if label == :day
    define_method("views_by_#{label.to_s}_per_day") do
      data = View.group(label).order(label).group_by_day(:created_at, format: "%B %d, %Y").count
      render json: data.chart_json
    end
  end
end
