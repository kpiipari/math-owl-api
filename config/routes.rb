Rails.application.routes.draw do
  namespace :api do
    resources :addition, except: [:new, :edit]
  end
end
