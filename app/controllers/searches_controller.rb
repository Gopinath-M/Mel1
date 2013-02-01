class SearchesController < ApplicationController
  before_filter :authenticate_user!
  def search
    #get the candidates for the current org
    #@candidates = Candidate.search params[:term], :with => { :organization_id => current_org.id}
  end

  def results
    @users = User.search(params[:term], :star => true)#.page(params[:page]).per(1)
    p @users.inspect
    render 'search'
  end
end
