Rails.application.routes.draw do
  namespace :api do
    resources :addition do
      collection do
        get "new"
      end
    end
    resources :substraction
    resources :multiply
  end
end
