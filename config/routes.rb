Rails.application.routes.draw do
	root 'underg#index'
	get '/about_us', to: 'underg#aboutUs'
  post '/users/login', to: 'users#login'
  get '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  get 'users/check_nick', to: 'users#ajaxNickChecker'
  get 'users/check_email', to: 'users#ajaxEmailChecker'
  resources :users, except: :destroy

end
