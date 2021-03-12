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
    member do
      delete :delete_image_attachment
      patch :add_image_attachment
    end
  end
end

