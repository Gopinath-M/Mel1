Melaka::Application.routes.draw do
  resources :dashboard
  devise_for :users, :controllers=>{:registrations => "registrations", :sessions => "sessions", }, :skip => [:sessions] do
    get "/sign_up", :to => "registrations#new", :as=> :new_user_sign_up
    post "/sign_up", :to => "registrations#create", :as =>  :user_sign_up
    get "/login" => "sessions#new", :as => :new_user_session
    post "/login" => "sessions#create", :as => :user_session
    get "/logout"=> "sessions#destroy", :as => :destroy_user_session
    get "/privacy_setting", :to => "registrations#privacy_setting", :as=> :privacy_setting_registrations
  end
  match '/activate/:activation_code'=>'users#activate',:activation_code => nil,:as => :activate
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
      get 'admin_activation'
      get 'user_activation'
      post 'activate_department_admin'
      post 'activate_department_user'
      get 'get_dept_for_users' #transfer dept to get users for selected dept
      get 'account_setting'
      put 'update_account_setting'
      get 'admin'
    end
  end
  resources :department_users do
    collection do
      post 'transfer'
      get 'get_departments'
      get 'get_units'
      get 'get_departments_for_user'
    end
  end
  resources :cms_pages
  resources :agencies do
    collection do
      post 'update_status'
    end
  end

  resources :units do
    collection do
      post 'update_status'
    end
  end
  resources :resource_categories  do
  collection do
     post 'update_status'
  end
  end
  resources :resource_sub_categories do
  collection do
     post 'update_status'
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
