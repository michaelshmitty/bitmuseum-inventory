Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    authenticated :user do
      root to: 'items#index', as: :authenticated_root
    end
  end

  resources :categories
  resources :brands
  resources :items do
    member do
      delete :destroy_image
    end
  end


  root to: redirect("/users/sign_in")
end
