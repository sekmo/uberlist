Rails.application.routes.draw do
  root to: "projects#index"
  resources :projects do
    resources :tasks do
      member do
        patch :complete, :uncomplete
      end
    end
  end
end
