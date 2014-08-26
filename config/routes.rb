Rails.application.routes.draw do
  root 'views#index'
  match '/total_views', to: 'views#total_views', via: :get
  match '/views_per_day', to: 'views#views_per_day', via: :get
  match '/average_duration', to: 'views#average_duration', via: :get
  resources :views, only: :index
end
