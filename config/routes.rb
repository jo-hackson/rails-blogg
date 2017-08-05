Rails.application.routes.draw do

  get 'welcome/index'

  # nested resource
  # add route so Rails knows where to nav to see comments
  resources :articles do
    resources :comments
  end

  # get '/' => 'pages#index' >> even though root is set, this one will be exec because it is before root

  #  map the root of the app to welcome controller like '/'
  root 'welcome#index'


end
