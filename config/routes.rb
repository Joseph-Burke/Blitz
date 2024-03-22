Rails.application.routes.draw do
  resources :cards, only: :new

  root "cards#new"
end
