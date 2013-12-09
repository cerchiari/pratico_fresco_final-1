PraticoFresco::Application.routes.draw do

  devise_for :users
  root 'pages#pag_inicial'

  get "/home", :controller => "pages", :action => "pag_inicial"
  get "/search", :controller => "pages", :action => "pag_busca", :as => 'busca'
  get "/category", :controller => "pages", :action => "category_search", :as => 'category_search'
  get "/sair", :controller => "pages", :action => "pag_sair", :as => 'sair'
  get "/pesquisa_item", :controller => "pages", :action => "item_search", :as => 'item_search'
  get "/compras", :controller => "pages", :action => "compras", :as => 'compras'
  get "/vercompra/:id", :controller => "pages", :action => "vercompra", :as => 'vercompra'
  post "/cria_compra_com_antiga", :controller => "pages", :action => "cria_compra_com_antiga"


  # Routes for the Purchase resource:
  # CREATE
  get '/purchases/new', controller: 'purchases', action: 'new', as: 'new_purchase'
  post '/purchases', controller: 'purchases', action: 'create', as: 'purchases'

  # READ
  get '/purchases', controller: 'purchases', action: 'index'
  get '/purchases/:id', controller: 'purchases', action: 'show', as: 'purchase'

  # UPDATE
  get '/purchases/:id/edit', controller: 'purchases', action: 'edit', as: 'edit_purchase'
  patch '/purchases/:id', controller: 'purchases', action: 'update'

  # DELETE
  delete '/purchases/:id', controller: 'purchases', action: 'destroy'
  #------------------------------

  # Routes for the Order resource:
  # CREATE
  get '/orders/new', controller: 'orders', action: 'new', as: 'new_order'
  post '/orders', controller: 'orders', action: 'create', as: 'orders'

  # READ
  get '/orders', controller: 'orders', action: 'index'
  get '/orders/:id', controller: 'orders', action: 'show', as: 'order'

  # UPDATE
  get '/orders/:id/edit', controller: 'orders', action: 'edit', as: 'edit_order'
  patch '/orders/:id', controller: 'orders', action: 'update'

  # DELETE
  delete '/orders/:id', controller: 'orders', action: 'destroy'
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get '/items/new', controller: 'items', action: 'new', as: 'new_item'
  post '/items', controller: 'items', action: 'create', as: 'items'

  # READ
  get '/items', controller: 'items', action: 'index'
  get '/items/:id', controller: 'items', action: 'show', as: 'item'

  # UPDATE
  get '/items/:id/edit', controller: 'items', action: 'edit', as: 'edit_item'
  patch '/items/:id', controller: 'items', action: 'update'

  # DELETE
  delete '/items/:id', controller: 'items', action: 'destroy'
  #------------------------------

  # Routes for the Subsecao resource:
  # CREATE
  get '/subsecaos/new', controller: 'subsecaos', action: 'new', as: 'new_subsecao'
  post '/subsecaos', controller: 'subsecaos', action: 'create', as: 'subsecaos'

  # READ
  get '/subsecaos', controller: 'subsecaos', action: 'index'
  get '/subsecaos/:id', controller: 'subsecaos', action: 'show', as: 'subsecao'

  # UPDATE
  get '/subsecaos/:id/edit', controller: 'subsecaos', action: 'edit', as: 'edit_subsecao'
  patch '/subsecaos/:id', controller: 'subsecaos', action: 'update'

  # DELETE
  delete '/subsecaos/:id', controller: 'subsecaos', action: 'destroy'
  #------------------------------

  # Routes for the Secao resource:
  # CREATE
  get '/secaos/new', controller: 'secaos', action: 'new', as: 'new_secao'
  post '/secaos', controller: 'secaos', action: 'create', as: 'secaos'

  # READ
  get '/secaos', controller: 'secaos', action: 'index'
  get '/secaos/:id', controller: 'secaos', action: 'show', as: 'secao'

  # UPDATE
  get '/secaos/:id/edit', controller: 'secaos', action: 'edit', as: 'edit_secao'
  patch '/secaos/:id', controller: 'secaos', action: 'update'

  # DELETE
  delete '/secaos/:id', controller: 'secaos', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create', as: 'users'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

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
