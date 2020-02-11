Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'

  devise_for :users, :controllers => { :registrations => :registrations }

  get "/contact", to: "pages#contact", as: "contact"
  root to: 'pages#home'

  resources :costumes, except: :destroy do
    resources :bookings, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, except: [ :show, :destroy, :new, :create ]

  resources :users do
    resources :bookings, only: [ :index, :show ]
  end
end
