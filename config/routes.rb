Rails.application.routes.draw do

  devise_for :users
  devise_for :views
  resources :rentals
  resources :students
  resources :apparels

  root 'pages#home'
  
  devise_scope :user do
    get 'auth' => "pages#auth", :as => :auth
  end


  get 'users/sign_in'=> "pages#auth"
  get 'users/sign_up' => "users#sign_up", as: :signup
  get 'users/:id' => 'users#show', as: :user
  delete 'users_destroy/:id' => 'pages#users_destroy', :via => :delete, :as => :admin_destroy_user
  get 'settings' => "pages#settings", as: :settings
  get 'appointments' => "pages#appointments", as: :appointments
  get 'available' => "apparels#index", as: :available
  get 'rentals' => "rentals#index"
  get 'students' => "students#index"
  get 'checkedout'=> "rentals#new", as: :checkedout
  get 'checkin'=> "pages#checkin", as: :checkin
  get 'checkout'=> "pages#checkout", as: :checkout
  get 'late'=> "pages#late", as: :late
  get 'manage'=> "pages#manage", as: :manage
  get 'signin'=> "pages#signin", as: :signin
  post 'rental_return' => "pages#rental_return", as: :return

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
