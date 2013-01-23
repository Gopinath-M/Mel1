class NewsletterImagesController < ApplicationController
  def new
    @newsletter_image = NewsletterImage.new
  end

  def create
    @newsletter_image = NewsletterImage.create(params[:newsletter_image])
    if @newsletter_image.valid?
      @newsletter_image.save!
      redirect_to(newsletter_images_path, :notice => 'Newsletter Image created successfully.')
    else
      render :action => 'new'
    end
  end
  
  def edit
    @newsletter_image = NewsletterImage.find(params[:id])
  end

  def update
    @newsletter_image = NewsletterImage.find(params[:id])
    if @newsletter_image.update_attributes(params[:newsletter_image])
      redirect_to(newsletter_images_path, :notice => 'Newsletter Image was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def index
    @newsletter_images = NewsletterImage.order("created_at desc").page(params[:page]).per(15)
  end

  def destroy
    @newsletter_image = NewsletterImage.find(params[:id])
    @newsletter_image.deleted = true
    if @newsletter_image.save
      redirect_to(newsletter_images_path, :alert => 'Newsletter Image deleted successfully.')
    end
  end
end
