Rails.application.routes.draw do
  devise_for :users
  root "people#index"

  # Routes for the Person resource:
  # CREATE
  get "/people/new", :controller => "people", :action => "new"
  post "/create_person", :controller => "people", :action => "create"

  # READ
  get "/people", :controller => "people", :action => "index"
  get "/people/:id", :controller => "people", :action => "show"

  # UPDATE
  get "/people/:id/edit", :controller => "people", :action => "edit"
  post "/update_person/:id", :controller => "people", :action => "update"

  # DELETE
  get "/delete_person/:id", :controller => "people", :action => "destroy"
  #------------------------------

  # Routes for the Sent_gift resource:
  # CREATE
  get "/sent_gifts/new", :controller => "sent_gifts", :action => "new"
  post "/create_sent_gift", :controller => "sent_gifts", :action => "create"

  # READ
  get "/sent_gifts", :controller => "sent_gifts", :action => "index"
  get "/sent_gifts/:id", :controller => "sent_gifts", :action => "show"

  # UPDATE
  get "/sent_gifts/:id/edit", :controller => "sent_gifts", :action => "edit"
  post "/update_sent_gift/:id", :controller => "sent_gifts", :action => "update"

  # AddNewRecipient
  post "/add_new_recipient", :controller => "sent_gifts", :action => "first_recipient"
  post "/add_new_recipient/:id", :controller => "sent_gifts", :action => "new_recipient"

  #RemoveRecipient
  post "/remove_recipient/:sent_gift_id,:person_id", :controller => "sent_gifts", :action => "remove_recipient"

  # DELETE
  get "/delete_sent_gift/:id", :controller => "sent_gifts", :action => "destroy"
  #------------------------------

  # Routes for the Received_gift resource:
  # CREATE
  get "/received_gifts/new", :controller => "received_gifts", :action => "new"
  post "/create_received_gift", :controller => "received_gifts", :action => "create"

  # READ
  get "/received_gifts", :controller => "received_gifts", :action => "index"
  get "/received_gifts/:id", :controller => "received_gifts", :action => "show"

  # UPDATE
  get "/received_gifts/:id/edit", :controller => "received_gifts", :action => "edit"
  post "/update_received_gift/:id", :controller => "received_gifts", :action => "update"

  # AddNewSender
  post "/add_new_sender", :controller => "received_gifts", :action => "first_sender"
  post "/add_new_sender/:id", :controller => "received_gifts", :action => "new_sender"

  #RemoveSender
  post "/remove_sender/:received_gift_id,:person_id", :controller => "received_gifts", :action => "remove_sender"

  # DELETE
  get "/delete_received_gift/:id", :controller => "received_gifts", :action => "destroy"
  #------------------------------

  # Routes for the Recipient resource:
  # CREATE
  get "/recipients/new", :controller => "recipients", :action => "new"
  post "/create_recipient", :controller => "recipients", :action => "create"

  # READ
  get "/recipients", :controller => "recipients", :action => "index"
  get "/recipients/:id", :controller => "recipients", :action => "show"

  # UPDATE
  get "/recipients/:id/edit", :controller => "recipients", :action => "edit"
  post "/update_recipient/:id", :controller => "recipients", :action => "update"

  # DELETE
  get "/delete_recipient/:id", :controller => "recipients", :action => "destroy"
  #------------------------------

  # Routes for the Sender resource:
  # CREATE
  get "/senders/new", :controller => "senders", :action => "new"
  post "/create_sender", :controller => "senders", :action => "create"

  # READ
  get "/senders", :controller => "senders", :action => "index"
  get "/senders/:id", :controller => "senders", :action => "show"

  # UPDATE
  get "/senders/:id/edit", :controller => "senders", :action => "edit"
  post "/update_sender/:id", :controller => "senders", :action => "update"

  # DELETE
  get "/delete_sender/:id", :controller => "senders", :action => "destroy"
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
