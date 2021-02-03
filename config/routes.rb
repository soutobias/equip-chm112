Rails.application.routes.draw do
  devise_for :users
  root to: "sensors#index"
  resources :sensors do
    resources :historic_sensors, only: [:index, :show]
  end
end
