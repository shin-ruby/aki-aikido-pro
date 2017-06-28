Rails.application.routes.draw do

  root 'static_pages#home'
  
  get  'about', to: 'static_pages#about'
  get  'price', to: 'static_pages#price'
  get  'contact', to: 'static_pages#contact'
  get  'privacy', to: 'static_pages#privacy'
  resources :messages, only: [:new, :create]
  resources :infos, only: [:index, :show]

  namespace :admin do
    root 'home#show', as: 'root'
    resources :infos do
      collection do
        post :upload
      end
    end

    resources :users, except: [:show, :edit, :update]
    resources :messages, only: [:index, :show]

    get '/login', to: 'sessions#new'
    post '/login', to:'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

end
