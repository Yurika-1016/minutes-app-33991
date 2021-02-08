Rails.application.routes.draw do
  devise_for :users
  root to: "minutes#index"
  resources :minutes, only:[:new, :create]
end
