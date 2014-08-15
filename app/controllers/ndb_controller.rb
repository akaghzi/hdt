class NdbController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:search]
      @fd_descs = FdDesc.search(params[:search])
    else
      @fd_descs = FdDesc.order("long_desc desc").limit(10)
    end
  end
  
  def show
    # @fd_desc = FdDesc.find(params[:ndb_no])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @fd_desc = FdDesc.find(params[:ndb_id])
    end
    
end