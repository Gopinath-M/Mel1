class DashboardController < ApplicationController
 
  before_filter :authenticate_user!
#  layout 'main_content'
  def index
    if current_user.is_super_admin?
       @users = Role.where(:name => "Department Admin").first.users
    elsif current_user.is_department_admin?      
      department = current_user.departments.first        
      @users = Department.find(department).users 
    end
  end
end
