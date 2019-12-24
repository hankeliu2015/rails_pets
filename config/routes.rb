Rails.application.routes.draw do
  resources :pets, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # get 'pets/:id', to: 'pets#show'
  # get 'pets', to: 'pets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
