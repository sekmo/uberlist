Rails.application.routes.draw do
  root to: "projects#index"
  resources :projects do
    resources :tasks do
    end
  end
end
