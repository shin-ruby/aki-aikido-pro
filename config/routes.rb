Rails.application.routes.draw do

  root 'static_pages#home'

  resources :infos, only:[:index, :show]
  
  get  'about', to: 'static_pages#about'
  get  'price', to: 'static_pages#price'
  get  'contact', to: 'static_pages#contact'

  namespace :admin do
    root 'home#show', as: 'root'
    resources :infos do
      collection do
        post :upload
      end
    end

    resources :users, except: [:show, :edit, :update]
    # resources :messages, except: [:new, :create]

    get '/login', to: 'sessions#new'
    post '/login', to:'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

end
