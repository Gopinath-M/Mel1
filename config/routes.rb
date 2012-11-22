Melaka::Application.routes.draw do

  resources :dashboard do
    collection do
      get 'def_dept'
      post 'change_default_department'
    end
  end

  devise_for :users, :controllers=>{:registrations => "registrations", :sessions => "sessions", }, :skip => [:sessions] do
    get "/sign_up", :to => "registrations#new", :as=> :new_user_sign_up
    post "/sign_up", :to => "registrations#create", :as =>  :user_sign_up
    get "/login" => "sessions#new", :as => :new_user_session
    post "/login" => "sessions#create", :as => :user_session
    get "/logout"=> "sessions#destroy", :as => :destroy_user_session
    get "/privacy_setting", :to => "registrations#privacy_setting", :as=> :privacy_setting_registrations
  end
  match '/activate/:activation_code'=>'users#activate',:activation_code => nil,:as => :activate
  resources :resource_bookings
  resources :resource_transportation_bookings do
    collection do
      get 'approve_request'
      get 'get_vehicles'
      post 'change_resource_status'
    end
  end

  resources :drivers
  resources :vehicles
  resources :vehicle_types
  
  resources :departments do
    collection do
      post 'update_status'
      post 'update_user_status'
      get 'depart_list'
      get 'depart_user_list'
    end
  end
  resources :static_pages do
    collection do
      get 'about_us'
      get 'feedback'
      get 'help'
      get 'privacy'
      get 'terms_and_conditions'
    end
  end
  resources :users do
    collection do
      post 'update_status'
      post 'update_assign'
      get 'transfer'
      post 'update_transfer'
      get 'assign_department'
      get 'transfer_unit'
      post 'transfer_update_unit'
      get 'assign_unit'
      post 'assign_update_unit'
      get 'admin_activation'
      get 'user_activation'
      post 'activate_department_admin'
      post 'activate_department_user'
      get 'get_dept_for_users' #transfer dept to get users for selected dept
      get 'account_setting'
      post 'update_account_setting'
      post 'update_default_department'
      get 'admin'
    end
  end
  resources :department_users do
    collection do
      post 'transfer'
      get 'get_departments'
      get 'get_units'
      get 'get_departments_for_user'
      get 'get_units_for_transfer'
    end
  end
  resources :messages do
    collection do
      get 'autocomplete_user_icnumber'
      get 'get_agencies'
      get 'get_departments'
      get 'get_units'
      get 'get_department_admin'
      get 'get_unit_admin'
      get 'post_messages'
      get 'post_comments'
    end
  end
    
  resources :cms_pages
  resources :agencies do
    collection do
      post 'update_status'
      get 'assign_resource_manager'
      post 'update_assign_resource_manager'
    end
  end

  resources :units do
    collection do
      post 'update_status'
    end
  end
  resources :categories  do
    collection do
      post 'update_status'
      get 'assign_category'
      post 'update_category'
      get 'update_category'
      get 'list_category_mapping'
      post 'update_category_mapping'
    end
  end
  resources :sub_categories do
    collection do
      post 'update_status'
      get 'get_sub_categories'
    end
  end
  resources :vendors do
    collection do
      post 'update_status'
      get 'vendor_store'
      post 'vendor_store'
      get 'get_sub_categories'
      get 'get_resources'
      get 'vendorstore_list'
    end
  end
  resources :resources do
    collection do
      get 'get_subcategory'
      post 'update_status'
      get 'get_resources'
      get 'get_resource_type'
    end
  end
  resources :resource_managers do
    collection do
      post 'update_status'
    end
  end
  resources :agency_stores do
    collection do
      get 'get_categories'
      get 'get_sub_categories'
      get 'get_resource'
      post 'update_status'
      get 'get_vehicles'
    end
  end
  #Error routes
  get '/not_authorized' => 'errors#not_authorized', :as => 'not_authorized'   
  get '/blocked' => 'errors#blocked', :as => 'blocked'  

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
  root :to => "application#home"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
