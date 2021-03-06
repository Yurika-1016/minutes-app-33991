Rails.application.routes.draw do
  devise_for :users
  root to: "minutes#index"
  resources :minutes do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :to_do_lists, only: [:new, :create, :edit, :update]
    collection do
      get 'search'
    end
    collection do
      get 'search_me'
    end
    collection do
      get 'search_not_close'
    end
    resources :pins, only: [:create, :destroy]
    resources :closes, only: [:create, :destroy]
  end
end
