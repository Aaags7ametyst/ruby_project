Rails.application.routes.draw do
 # get 'user_sessions/new'

 # get 'user_sessions/create'

 # get 'user_sessions/destroy'

 resource :user_session, :only => [:new, :create, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :committees_voivodships

  resources :committees_districts

  resources :voivodships

  resources :districts

  resources :committees

  resources :users

  root :to => 'static#index'
  resource :user_session, :only => [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/central', :controller => 'static', :action => 'central'
  get '/role_district', :controller => 'static', :action => 'district'
  get '/invalid', :controller => 'committees_voivodships', :action => 'invalid'
  get '/all_districts', :controller => 'committees_districts', :action => 'all'
  
  get '/votes_voivodships', :controller => 'committees_voivodships', :action => 'full'
  get '/percentage_voivodships', :controller => 'committees_voivodships', :action => 'turnout'
  get '/percentage_districts', :controller => 'committees_voivodships', :action => 'percentage'
 
  get '/results', :controller => 'committees_voivodships', :action => 'results'
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
