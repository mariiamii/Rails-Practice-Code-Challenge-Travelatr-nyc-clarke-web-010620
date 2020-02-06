Rails.application.routes.draw do
  resources :bloggers, only: [:index, :show, :new, :create] 
  resources :posts, only: [:index, :show, :new, :create, :edit, :update] 
  resources :destinations, only: [:index, :show, :new, :create] 

  #Custome route:
  patch '/like/:id', to: 'posts#like', as: 'like'
end