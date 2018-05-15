Rails.application.routes.draw do
  namespace :api do
    resources :addition do
      collection do
        get "new"
      end
    end
    resources :substraction do
      collection do
        get "new"
      end
    end
    resources :multiply do
      collection do
        get "new"
      end
    end
    resources :player
  end
end
