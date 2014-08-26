Rails.application.routes.draw do
  root 'views#index'
  match '/total_views', to: 'pages#total_views', via: :get
  match '/views_per_day', to: 'pages#views_per_day', via: :get
  match '/duration', to: 'pages#duration', via: :get
  match '/average_duration', to: 'pages#average_duration', via: :get
  [:os, :browser, :country, :day].each do |label|
    path = "views_by_#{label.to_s}"
    match path, to: "views##{path}", via: :get
    path = "average_duration_by_#{label.to_s}"
    match path, to: "views##{path}", via: :get
    path = "duration_by_#{label.to_s}"
    match path, to: "views##{path}", via: :get
    next if label == :day
    path = "views_by_#{label.to_s}_per_day"
    match path, to: "views##{path}", via: :get
  end
  resources :views, only: :index
end
