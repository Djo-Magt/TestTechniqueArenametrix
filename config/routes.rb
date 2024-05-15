Rails.application.routes.draw do
  root to: "file_items#index"

  resources :file_items, only: [:create, :destroy]

  resources :reservations, only: [:create] do
    collection do
      get :show
    end
  end
end
