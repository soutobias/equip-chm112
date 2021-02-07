Rails.application.routes.draw do
  devise_for :users
  root to: "sensors#index"
  resources :sensors do
    post "download", to: "sensors#download"
    resources :historic_sensors, only: [:index, :show]
  end
end
