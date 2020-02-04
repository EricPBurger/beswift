Rails.application.routes.draw do
  devise_for :users


  get "/contact", to: "pages#contact", as: "contact"
  root to: 'pages#home'

  resources :costumes, except: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
