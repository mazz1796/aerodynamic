Rails.application.routes.draw do
  

  #get 'pages/home'
  root 'pages#home'


  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks', 
  							:registrations => 'registrations'}#need to deglare when create custom controllers on top of 'devise' controller

  resources :users, only: [:show] #user controllerのshowアクションのみということ。Resourceとはコントローラーのこと。

  resources :cars do
    resources :reservations, only: [:create]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'


  resources :cars
  resources :photos

end
