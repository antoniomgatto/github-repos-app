Rails.application.routes.draw do
  resources :repositories
  root :to => 'repositories#index'
end
