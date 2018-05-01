Rails.application.routes.draw do
  namespace :api do
    resources :addition
    resources :substraction
    resources :multiply
  end
end
