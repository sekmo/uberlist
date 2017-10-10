Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :projects do
    resources :tasks, shallow: true do
      member do
        patch :complete, :uncomplete
      end
    end
  end
end
