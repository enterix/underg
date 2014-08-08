Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru|uk/ do
    root 'underg#index'
    get '/about_us', to: 'underg#aboutUs'
    post '/users/login', to: 'users#login'
    get '/users/login', to: 'users#login'
    get '/users/logout', to: 'users#logout'
    get 'users/check_nick', to: 'users#ajaxNickChecker'
    get 'users/check_email', to: 'users#ajaxEmailChecker'
    resources :users, except: :destroy
    resources :forms
  end
  #if didn't find anything - it can be root with locale
  get '/:locale', to: 'underg#index', locale: /en|ru/
end
