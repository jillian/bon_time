TimeOn::Application.routes.draw do
  root "homes#index"

  resources :messages, only: [:new, :create]

  resources :friendships, only: [:create] do
    member do
      post :accept_invitation
      post :decline_invitation
      post :revoke
    end
  end

  resources :locations

  resources :events do
      match '/events/new', to: 'events#create', via: :post
    resources :attendances, only: [:create] do
      member do
        post :send_invite
        post :accept_invite
        post :decline_invite
      end
    end
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do 
    resources :users, only: [:index, :show, :edit] do
      # member do
      #   get :befriend
      # end
    match '/users/sign_up', to: 'registrations#new', via: :post
    end
  end

  # post '/locations', to: 'locations#create'
end
