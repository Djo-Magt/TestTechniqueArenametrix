Rails.application.routes.draw do
  root to: redirect("/reservations")

  resources :reservations, only: [:index] do
    collection do
      post :import
      get :filter_by_spectacle
      get :analyse
    end
  end
end
