Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}
  get 'home/index'
  root 'home#index'

  authenticate :user do
    resources :posts
  end

  match "/contacts/:importer/callback" => "posts#contact", :via => [:get]

  match "/oauth2callback" => "posts#contact", :via => [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
