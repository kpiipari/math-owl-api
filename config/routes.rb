Rails.application.routes.draw do
  namespace :api do
    resources :addition, except: [:new, :edit]
    resources :substraction, except: [:new, :edit]
    resources :multiply, except: [:new, :edit]
  end
end
