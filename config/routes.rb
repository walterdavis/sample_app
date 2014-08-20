SampleApp::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  match '/signup', to: "users#new", via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  root 'static_pages#home'
end
