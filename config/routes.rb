Rails.application.routes.draw do
  root 'sessions#new'
  get    'contact' => 'static_pages#contact'
  get    'how_to_play' => 'static_pages#how_to_play'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new' # page for a new session
  post   'login'   => 'sessions#create' # create a new session
  delete 'logout'  => 'sessions#destroy'

  resources :submissions
  resources :users
  resources :shows
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
