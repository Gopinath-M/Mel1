class CmsPagesController < ApplicationController
  uses_tiny_mce
  def index
    @cms_pages = CmsPage.all
  end
  def new
    @cms_pages = CmsPage.new
  end
  def create
    @cms_pages = CmsPage.new(params[:cms_page])
    @cms_pages.save
     redirect_to(cms_pages_path, :notice => 'Page created successfully.')
  end
  def update
    @cms_pages = CmsPage.find(params[:id])
    @cms_pages.update_attributes(params[:cms_page])
    
  end
  def edit
   @cms_pages = CmsPage.find(params[:id])
  end
  def show
    @cms_pages = CmsPage.find(params[:id])
  end
end
