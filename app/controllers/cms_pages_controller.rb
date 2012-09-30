class CmsPagesController < ApplicationController
  #  uses_tiny_mce
  def index
    @cms_pages = CmsPage.all
  end

  def new
    @cms_page = CmsPage.new
  end

  def create
    @cms_page = CmsPage.new(params[:cms_page])
    @cms_page.save
    redirect_to(cms_pages_path, :notice => 'Page created successfully.')
  end

  def update
    @cms_page = CmsPage.find(params[:id])
    @cms_page.update_attributes(params[:cms_page])
  end

  def edit
    @cms_page = CmsPage.find(params[:id])
  end
  
  def show
    @cms_page = CmsPage.find(params[:id]) 
  end
end
