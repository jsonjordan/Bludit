Rails.application.routes.draw do
  devise_for :users
  root "subbludits#index"

  get "users/picture" => "users#picture"
  get "sandboxes/votes" => "sandboxes#votes"
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

  resources :users

  resources :moderators, except: [:show, :edit, :update]

  resources :subbludits do
    resources :messages, except: [:index], shallow: true do
      resources :comments, shallow: true
    end
  end

  resources :messages do
    member do
      put "like", to: "messages#upvote"
      put "dislike", to: "messages#downvote"
    end
  end

  resources :sandboxes, only: [] do
    member do
      put "like", to: "sandboxes#upvote"
      put "dislike", to: "sandboxes#downvote"
      get "votecount", to: "sandboxes#votecount"
      patch "reset", to: "sandboxes#reset"
    end
  end


end
