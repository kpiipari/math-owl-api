Rails.application.routes.draw do
  namespace :api do
    resources :addition_game, except: [:new, :edit]
  end
end
