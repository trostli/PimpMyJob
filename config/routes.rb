ProMapper::Application.routes.draw do
  resources :categories, :only => [:index]

  get 'import', to: 'jobs#upload'
  post 'import', to: 'jobs#import'

  root :to => 'categories#index'
end
