Rails.application.routes.draw do
  root to: "file_items#index"

  resources :file_items, only: [:create, :destroy]

  resources :reservations, only: [:index] do
    collection do
      post :create
      get :analyse
    end
  end
end
