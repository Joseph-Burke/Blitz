Rails.application.routes.draw do
  resource :cards, only: :create
end
