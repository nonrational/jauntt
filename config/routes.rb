Rails.application.routes.draw do
  root to: "rooms#create"

  resources :rooms
end
