Rails.application.routes.draw do
  devise_for :users
  root to: "sensors#index"
  get "admin", to: "pages#admin"
  resources :places
  resources :situations
  resources :items
  resources :item_types
  resources :sensors do
    post "download", to: "sensors#download"
    resources :historic_sensors, only: [:index, :show]
  end
end
