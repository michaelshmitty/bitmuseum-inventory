Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end
  end

  root to: redirect("/users/sign_in")
end
