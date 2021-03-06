Rails.application.routes.draw do

   namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        member do
          get   'role'
          put   'update_password'
          patch 'update_password'
        end
        collection  do
          post 'login'
          get 'search', to: 'users#search'
        end 
      end
      resources :roles, except: [:new, :edit] do
        member do
          get   'permissions', to: 'roles#show_permissions'
          post  'permissions', to: 'roles#assign_permissions'
        end
        collection do
          get 'search', to: 'roles#search'
        end
      end
      resources :companies, except: [:new, :edit] do
        collection do
          get 'search', to: 'companies#search'
        end
        member do
          get 'vehicles', to: 'companies#get_vehicles'
        end
      end
      resources :vehicles, except: [:new, :edit] do
        collection do
          get 'search', to: 'vehicles#search'
        end
      end
      resources :rides, except: [:new, :edit]
      resources :gps, except: [:new, :edit]
      resources :controller_actions, only: [:index]
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
