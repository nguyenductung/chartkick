class View < ActiveRecord::Base
  class << self
    def duration_by_day
      h = {}
      max_hash = View.group_by_day(:created_at, format: "%B %d, %Y").maximum(:duration)
      min_hash = View.group_by_day(:created_at, format: "%B %d, %Y").minimum(:duration)
      max_hash.each do |k, v|
        h[["maximum", k]] = v
        h[["minimum", k]] = min_hash[k]
      end
      h.chart_json
    end
  end
end
