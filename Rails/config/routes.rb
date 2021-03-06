SS::Application.routes.draw do
  resources :users  do
    # resources :supervisor_users, only: [:create, :destroy]
    # member do
    #   get :following, :followers
    # end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :sleeps,   only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root  'static_pages#home'

  #match '/help',       to: 'static_pages#help',    via: 'get'
  match '/about',       to: 'static_pages#about',         via: 'get'
  match '/contact',     to: 'static_pages#contact',       via: 'get'
  match '/signup',      to: 'users#new',                  via: 'get'
  match '/signin',      to: 'sessions#new',               via: 'get'
  match '/signout',     to: 'sessions#destroy',           via: 'delete'
  match '/supervisor',  to: 'users#show_supervisor',      via: 'get'
  match '/supervised',  to: 'users#show_supervised_users',via: 'get'
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users, :sessions, :sleeps
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
