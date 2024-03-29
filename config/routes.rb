Melaka::Application.routes.draw do

  resources :dashboard do
    collection do
      get 'def_dept'
      post 'change_default_department'
      get 'set_locale'
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
  get "/search" => "searches#search"
  post "/search" => "searches#results"
  match '/activate/:activation_code'=>'users#activate',:activation_code => nil,:as => :activate

  resources :feeds, :only=>[:index]
  resources :templates do
    collection do
      get 'use_template'
      post 'send_mail'
    end
  end
  resources :newsletters do
    get :autocomplete_email, :on => :collection
  end
  resources :newsletter_images
  resources :resource_bookings do
    collection do
      get 'get_other_sub_categories'
      get 'get_booked'
      get 'get_resources'
      put 'cancel_other_request'
      get 'list_others_booking'
      get 'resource_booking_approval'
      get 'list_resource_booking'
      put 'update_resource_booking'
      post 'user_return'
      get 'download_attachments'
    end
  end
  
  resources :vehicle_model_types
  resources :groups do
    collection do
      post 'update_status'
    end
  end

  resources :group_members do
    collection do
      post 'update_status'
    end
  end

  resources :ict_hardware_bookings do
    collection do
      get 'requests'
      get 'download_attachments'
      get 'list_requisition_hardware'
      get 'approve'
      put 'update_request'
    end
  end

  resources :ict_firewalls do
    collection do
      get 'add_select_boxes'
      get 'list_ict_firewall'
      get 'list_requisition_firewall'
      get 'download_attachments'
    end
  end

  resources :user_services
  resources :outstations do
    collection do
      get 'approve_request'
      get 'approve_request_for_state'
    end
  end

  resources :resource_ict_equipment_bookings do
    collection do
      get 'requests'
      get 'list_ict_equipment_booking'
      get 'download_attachments'
      put 'cancel_ict_equipment_request'
      get 'get_value_of_resource'
      get 'approve_request'
      put 'update_booking'
      post 'user_return'
      get 'search_other_resource'
    end
  end

  resources :ict_network_points do
    collection do
      get 'approval_network_point'
      get 'list_to_select_ict'
      get 'get_hardware_type'
      get 'get_location_for_hardware'
      get 'list_requisition_network'
      get 'selected_list_ict'
      put 'update_approval_network_point'
      get 'list_ict_network'
      get 'download_attachments'
    end
  end

  resources :settings do
    collection do
      post 'update_timeline_for_approver'
    end
  end

  resources :resource_transportation_bookings do
    collection do
      get 'request_view'
      get 'approve_request'
      get 'get_driver_details'
      get 'get_vehicles'
      post 'change_resource_status'
      put 'cancel_transport_request'
      get 'list_transport_booking'
      get 'user_return_status'
      get 'download_attachments'
      get 'get_vehicle_brands'
      get 'get_booked_and_available_vehicles'  
      get 'get_other_agency_vehicles'
    end
  end

  resources :facility_ict_agencies do
    collection do
      post 'update_status'
    end
  end

  resources :facility_ict_softwares do
    collection do
      post 'update_status'
    end
  end

  resources :facility_ict_hardwares do
    collection do
      post 'update_status'
    end
  end

  resources :facility_ict_servers do
    collection do
      post 'update_status'
    end
  end

  resources :facility_ict_services do
    collection do
      post 'update_status'
    end
  end

  resources :facility_ict_wirings do
    collection do
      post 'update_status'
    end
  end

  resources :drivers do
    collection do
      post 'update_status'
    end
  end

  resources :vehicles
  resources :vehicle_types

  resources :resource_room_bookings do
    collection do
      get 'get_list_of_facility'
      get 'list_resource_booking'
      get 'resource_room_booking_approval'
      get 'get_booked_rooms'
      get 'list_room_booking'
      get 'room_booking_approval'
      put 'update_room_booking'
      put 'cancel_room_request'
      get 'get_resources'
      get 'get_details_for_resource'
      post 'user_return'
      get 'download_attachments'
    end
  end
  
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
      get 'list_of_user'
      get 'get_admin_for_users'
      get 'assign_unit'
      get 'get_role_for_admin'
      post 'assign_update_unit'
      get 'admin_activation'
      get 'get_approvers'
      get 'user_activation'
      post 'activate_department_admin'
      get 'change_department_admin'
      get 'get_dept_admin'
      post 'update_department_admin'
      post 'activate_department_user'
      get 'get_dept_for_users' #transfer dept to get users for selected dept
      get 'account_setting'
      post 'update_account_setting'
      post 'update_default_department'
      get 'admin'
      post 'update_user_profile'
      get 'user_profile'
      get 'emergency_reference'
      put 'emergency_reference'
      get 'declaration_property'
      post 'declaration_property'
      get 'download_attachments'
      get 'get_dept_admin'
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
      get 'get_groups'
      get 'get_department_admin'
      get 'get_unit_admin'
      get 'post_messages'
      get 'post_comments'
      get 'download_attachments'
      get 'uploads'
    end
  end
    
  resources :cms_pages
  resources :agencies do
    collection do
      get 'for_agency'
      post 'update_status'
      get 'list_resource_manager'
      get 'assign_resource_manager'
      put 'update_assign_resource_manager'
      post 'update_assign_resource_manager'
      get 'role_memberships'
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
    end
  end

  resources :resources do
    collection do
      get 'get_subcategory'
      post 'update_status'
      get 'list_approver'
      get 'get_resources'
      post 'update_resource_approver'
      get 'get_approvers'
      get 'resource_approver'
      get 'get_resource_type'
      get 'get_sub_category'
      get 'resource_has_serial_no'
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
      get 'get_resources'
      post 'update_status'
      get 'get_vehicles'
      get 'get_transport'
      get 'get_other_sub_categories'
      get 'get_resource'
      get 'get_agency_resource'
      get 'get_other_resource'
    end
  end

  resources :facilities do
    collection do
      post 'update_status'
    end
  end  
  #Error routes
  get '/not_authorized' => 'errors#not_authorized', :as => 'not_authorized'   
  get '/blocked' => 'errors#blocked', :as => 'blocked' 
  # Online chat
  resources :conversations do
    collection do
      get 'conversations'
      post 'send_request'
      get 'list_users'
    end
  end

  resources :rooms do
    collection do
      post 'update_status'
    end
  end

  resources :software_installations do
    collection do
      get 'approval_software_installation'
      get 'resource_booking_approval'
      post 'resource_booking_approval'
      get 'list_requisition_softwares'
      get 'add_select_boxes'
      get 'download_attachments'
    end
  end

  resources :ict_vpns  do
    collection do
      get 'approval'
      put 'approval'
      get 'list_requisition_vpn'
      get 'download_attachments'
      get 'list_vpn'
    end

  end
  
  resources :ict_system_accesses do
    collection do
      get 'approval'
      get 'list_requisition_software'
      put 'approval'
      get 'download_attachments'
      get 'list_system_access'
    end
  end

  resources :complaint_building_assets do
    collection do
      get 'approval'
      put 'approval'
      get 'get_categories'
      get 'get_categories_types'
      get 'list_complaint_building_asset'
    end
  end

  resources :complaint_computers do
    collection do
      get 'approval'
      put 'approval'
      get 'get_system_types'
      get 'get_system_items'
      get 'list_complaint_computer'
    end
  end
  resources :conversation_groups do
    collection do
      get 'conversations'
      post 'send_request'
      get 'list_users'
     
    end
  end
  resources :custom_group_users

  resources :custom_groups do
    collection do
      post 'update_status'
      get 'get_custom_group_names'
    end
  end

  resources :events do
    collection do
      post 'update_status'
      get 'hide'
      get 'hide_index'
      get 'event_index'
      get 'list_event'
    end
  end

  resources :advertisements do
    collection do
      post 'update_status'
      get 'hide'
      get 'hide_index'
      get 'advertisement_index'
      get 'list_advertisement'

    end
  end
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
