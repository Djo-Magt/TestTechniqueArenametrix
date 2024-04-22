Rails.application.routes.draw do
  root to: redirect("/reservations")
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # config/routes.rb

  resources :reservations do
    collection do
      post :import
    end
  end
end
