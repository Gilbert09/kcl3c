Rails.application.routes.draw do

  root :to => 'static#index'

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  get '/login' => 'clearance/sessions#new', as: 'sign_in'
  delete '/logout' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/register' => 'clearance/users#new', as: 'sign_up'

  resources :property

  get 'how-it-works' => 'static#howitworks', as: 'how_it_works'
  get 'fees' => 'static#fees', as: 'fees'
  get 'advice' => 'static#advice', as: 'advice'
  get 'faq' => 'static#faq', as: 'faq'

  get 'about' => 'static#about', as: 'about'
  get 'contact' => 'static#contact', as: 'contact'
  get 'terms' => 'static#terms', as: 'terms'
  get 'cookie' => 'static#cookie', as: 'cookie'

  get 'account' => 'static#account', as: 'account'
  get 'account/create' => 'static#createListing', as: 'account_create'
  get 'account/incomplete' => 'static#incompleteListings', as: 'account_incomplete'
  get 'account/active' => 'static#activeListings', as: 'account_active'
  get 'account/inactive' => 'static#inactiveListings', as: 'account_inactive'
  get 'account/details' => 'static#details', as: 'account_details'
  get 'account/details/edit' => 'static#editDetails', as: 'account_details_edit'

  get 'wizard' => 'wizard#index'
  get 'save' => 'wizard#draft'
  get ':action' => 'static#:action'
  
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
