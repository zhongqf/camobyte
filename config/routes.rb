Camobyte::Application.routes.draw do


  match '/auth/:provider/callback', :to => 'sessions#callback'

  devise_for :users
  resources :users
  
  resources :workspaces do
    
  end
  match '/my_workspaces' => 'workspaces#list', :as => :all_workspaces

  
  match '/account/settings' => 'users#edit', :as => :account_settings, :sub_action => 'settings'
  match '/account/picture' => 'users#edit', :as => :account_picture, :sub_action => 'picture'
  match '/account/profile' => 'users#edit', :as => :account_profile, :sub_action => 'profile'
  match '/account/linked_accounts' => 'users#edit', :as => :account_linked_accounts, :sub_action => 'linked_accounts'
  match '/account/notifications' => 'users#edit', :as => :account_notifications, :sub_action => 'notifications'
  match '/account/delete' => 'users#edit', :as => :account_delete, :sub_action => 'delete'
  


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  
  root :to => "users#dashboard"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
#== Route Map
# Generated on 25 Sep 2011 22:19
#
#         new_user_session GET    /users/sign_in(.:format)           {:action=>"new", :controller=>"devise/sessions"}
#             user_session POST   /users/sign_in(.:format)           {:action=>"create", :controller=>"devise/sessions"}
#     destroy_user_session DELETE /users/sign_out(.:format)          {:action=>"destroy", :controller=>"devise/sessions"}
#            user_password POST   /users/password(.:format)          {:action=>"create", :controller=>"devise/passwords"}
#        new_user_password GET    /users/password/new(.:format)      {:action=>"new", :controller=>"devise/passwords"}
#       edit_user_password GET    /users/password/edit(.:format)     {:action=>"edit", :controller=>"devise/passwords"}
#                          PUT    /users/password(.:format)          {:action=>"update", :controller=>"devise/passwords"}
# cancel_user_registration GET    /users/cancel(.:format)            {:action=>"cancel", :controller=>"devise/registrations"}
#        user_registration POST   /users(.:format)                   {:action=>"create", :controller=>"devise/registrations"}
#    new_user_registration GET    /users/sign_up(.:format)           {:action=>"new", :controller=>"devise/registrations"}
#   edit_user_registration GET    /users/edit(.:format)              {:action=>"edit", :controller=>"devise/registrations"}
#                          PUT    /users(.:format)                   {:action=>"update", :controller=>"devise/registrations"}
#                          DELETE /users(.:format)                   {:action=>"destroy", :controller=>"devise/registrations"}
#                    users GET    /users(.:format)                   {:action=>"index", :controller=>"users"}
#                          POST   /users(.:format)                   {:action=>"create", :controller=>"users"}
#                 new_user GET    /users/new(.:format)               {:action=>"new", :controller=>"users"}
#                edit_user GET    /users/:id/edit(.:format)          {:action=>"edit", :controller=>"users"}
#                     user GET    /users/:id(.:format)               {:action=>"show", :controller=>"users"}
#                          PUT    /users/:id(.:format)               {:action=>"update", :controller=>"users"}
#                          DELETE /users/:id(.:format)               {:action=>"destroy", :controller=>"users"}
#               workspaces GET    /workspaces(.:format)              {:action=>"index", :controller=>"workspaces"}
#                          POST   /workspaces(.:format)              {:action=>"create", :controller=>"workspaces"}
#            new_workspace GET    /workspaces/new(.:format)          {:action=>"new", :controller=>"workspaces"}
#           edit_workspace GET    /workspaces/:id/edit(.:format)     {:action=>"edit", :controller=>"workspaces"}
#                workspace GET    /workspaces/:id(.:format)          {:action=>"show", :controller=>"workspaces"}
#                          PUT    /workspaces/:id(.:format)          {:action=>"update", :controller=>"workspaces"}
#                          DELETE /workspaces/:id(.:format)          {:action=>"destroy", :controller=>"workspaces"}
#           all_workspaces        /my_workspaces(.:format)           {:controller=>"workspaces", :action=>"list"}
#         account_settings        /account/settings(.:format)        {:controller=>"users", :action=>"edit"}
#          account_picture        /account/picture(.:format)         {:controller=>"users", :action=>"edit"}
#          account_profile        /account/profile(.:format)         {:controller=>"users", :action=>"edit"}
#  account_linked_accounts        /account/linked_accounts(.:format) {:controller=>"users", :action=>"edit"}
#    account_notifications        /account/notifications(.:format)   {:controller=>"users", :action=>"edit"}
#           account_delete        /account/delete(.:format)          {:controller=>"users", :action=>"edit"}
#                     root        /                                  {:controller=>"users", :action=>"dashboard"}
