Rails.application.routes.draw do
  root to: "rooms#create"

  resource :user

  resources :rooms do
    resources :messages
    resources :members, controller: :room_members
  end
end
