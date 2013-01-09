class TemplatesController < ApplicationController

  def new
    @template = Template.new
  end
  def create   
    @template = Template.create(params[:template])
    @template.user_id = current_user.id
    if @template.save
      redirect_to templates_path 
    else 
      render templates_path 
    end
  end

  def edit
    @template = Template.find(params[:id])
  end
  
  def update
    @template = Template.find(params[:id])
    if @template.update_attributes(params[:template])
      redirect_to templates_path
    else
      render templates_path
    end
  end

  def index   
    @templates = Template.all
  end

  def destroy
    @template = Template.find(params[:id])
    if @template.destroy
      redirect_to templates_path
    end
  end

end
