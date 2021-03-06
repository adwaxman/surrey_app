Rails.application.routes.draw do


  namespace :admin do
  get 'home/index'
  end

  namespace :admin do
  get 'outreaches/new'
  end

  namespace :driver do
  get 'sessions/new'
  end

  root 'home#index'

  resources :rides
  resources :origins
  resources :members
  resources :drivers
  resources :destinations
  resources :admins
  resources :notes

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  post 'drivers/inactive', to: 'drivers#inactive'
  post 'members/inactive', to: 'members#inactive'
  post 'drivers/reactivate', to: 'drivers#reactivate'
  post 'members/reactivate', to: 'members#reactivate'
  get 'drivers/prompt/:id', to: 'drivers#prompt', as: 'driver_prompt'
  post 'drivers/search', to: 'drivers#search'
  post 'members/search', to: 'members#search'


  namespace :admin do
    resources :members, :drivers, :rides, :origins, :destinations, :outreaches, :admins, :notes
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get  'logout', to: 'sessions#destroy'
    post 'assign', to: 'rides#assign'
    post 'unassign', to: 'rides#unassign'
    post 'rides/cancel', to: 'rides#cancel'
    get 'canceled', to: 'rides#canceled'
    get 'select', to: 'rides#select'

    post 'rides/new', to: 'rides#new'
    post 'rides/complete', to: 'rides#complete'

    post 'admins/inactive', to: 'admins#inactive'

    root 'home#index'

    get 'archived', to: 'rides#archived'
    get 'rides/past/:id', to: 'rides#past', as: 'past_ride'



  end

  namespace :driver do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get  'logout', to: 'sessions#destroy'
    get 'driverpanel/:id', to: 'drivers#show', as: 'driverpanel'
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
