Rails.application.routes.draw do
  get 'milestones/create'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root "home#index"
  resources :users do
    resources :recurring_goals
    resources :milestone_tracks
    resources :milestones
    resources :supporters
  end

  resources :recurring_goals do
      resources :recurring_goals
  end

  get '/users/:id/recurring_goals/:id/updateForm', to: 'recurring_goals#update_form'
  get '/milestone_tracks/:id/createForm', to: 'milestone_tracks#create_form'
  get '/milestones/:id/updateForm', to: 'milestones#update_form'
  get '/milestone_tracks/:id/updateProgress', to: 'milestone_tracks#update_progress'

  resources :milestone_tracks do
      resources :milestones
  end

  resources :supporters do
      resources :supporters
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
