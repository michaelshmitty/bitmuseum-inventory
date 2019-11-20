Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    authenticated :user do
      root to: 'items#index', as: :authenticated_root
    end
  end

  resources :items


  root to: redirect("/users/sign_in")
end
