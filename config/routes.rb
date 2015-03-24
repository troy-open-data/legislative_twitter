Rails.application.routes.draw do

  resources :meetings

  resources :organizations

  resources :statuses

  resources :legislations

  get 'meetings/:id/agenda' => 'meetings#agenda', as: 'agenda'
  get 'meetings/:id/minutes' => 'meetings#minutes', as: 'minutes'

  # Toggle Agenda and Minutes
  get 'toggle_agenda/:id' => 'meetings#toggle_agenda', as: 'toggle_agenda'
  get 'toggle_minutes/:id' => 'meetings#toggle_minutes', as: 'toggle_minutes'

  get 'meetings/start_meeting/:id' => 'meetings#start_meeting', as: 'start_meeting'

  get 'search' => "search#search", :as => :search

  post 'versions/:id/revert' => 'versions#revert', :as => 'revert_version'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'meetings#index'

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
