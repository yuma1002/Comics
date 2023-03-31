Rails.application.routes.draw do
   devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }
namespace :customers do

          resources :bookmarks, only: [:index, :create, :update, :destroy]
end
  scope module: 'customers' do
    root 'items#top'
    resources :items, only: [:show, :index]
    get 'about' => 'items#about'

      resources :bookmarks, only: [:index, :create, :update, :destroy]
       resources :customers, only: [:show, :edit, :update] do
       #get :cart_items, on: :collection
       resources :customers, only: [:show] do 
           
           resources :items, only: %i[index new create show edit destroy update], shallow: true do
  get :bookmarks, on: :collection
  resource :bookmarks, only: %i[create destroy]
end
  end
   end
   end
   
 
   

   resources :bookmarks, only: [:create, :destroy]
 

  namespace :customers do
      resources :items, only: [:new, :create, :index, :show, :destroy] do
          
  
    resources :post_comments, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
   
   resources :genres, only: [:show]
   patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
 
   get 'customers/edit' => 'customers#edit'
   patch 'update' => 'customers#update'
   get 'quit' => 'customers#quit'
   get 'orders/about' => 'orders#about', as: 'orders_about'
   get 'orders/complete' => 'orders#complete'
   resources :orders, only: [:create, :new, :index, :show]
   resources :bookmarks, only: [:index, :create, :update, :destroy]

 
  end

  # adminルーティング
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  namespace :admins do
   root :to => 'top#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
