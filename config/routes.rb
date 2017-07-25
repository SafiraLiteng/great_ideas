Rails.application.routes.draw do
  devise_for :users

  resources :ideas do
    resources :comments do

    end
  end
  root "ideas#index"
end
