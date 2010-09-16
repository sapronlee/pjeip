ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  
  #首页 
  map.root :controller => :home, :action => :index
  
  #登录与登出
  map.login 'login', :controller => :home, :action => :login
  map.login_user 'login_user', :controller => :home, :action => :login_user
  map.logout 'logout', :controller => :home, :action => :logout
  
  map.namespace :admin do |admin|
    admin.root :controller => :home, :action => :index
    admin.resources :users
    admin.resources :groups
    admin.resources :positions
    admin.resources :roles, 
      :member => { :users => :get, 
                   :update_users => :put, 
                   :permissions => :get, 
                   :update_permissions => :put }
    admin.resources :permissions
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
