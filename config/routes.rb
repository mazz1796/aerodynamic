Rails.application.routes.draw do
  

  #get 'pages/home'
  root 'pages#home'


  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks', 
  							:registrations => 'registrations'}#need to deglare when create custom controllers on top of 'devise' controller

  resources :users, only: [:show] #user controllerのshowアクションのみということ。Resourceとはコントローラーのこと。
  resources :cars
  resources :photos
  resources :cars do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :cars do
    resources :reviews, only: [:create, :destroy]
  end
  
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'


  get '/your_bookings' => 'reservations#your_bookings'
  get '/your_reservations' => 'reservations#your_reservations'

  get '/search' => 'pages#search'

end
