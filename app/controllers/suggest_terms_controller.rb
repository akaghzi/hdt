class SuggestTermsController < ApplicationController
  def index
    # render json: %w[honey coffee egg]    
    # autocomplete :fd_desc, :long_desc
    render json: FdDesc.tsearch(params[:term]).limit(20).pluck("long_desc")
  end
  
  def li_terms
    render json: ListItem.where(user_id: current_user.id).tsearch(params[:term].downcase).limit(20).pluck("name")
  end
  
  def fi_terms
    render json: FavoriteItem.where(user_id: current_user.id).tsearch(params[:term].downcase).limit(20).pluck("name")
  end
  
  def ti_terms
    render json: Task.where(user_id: current_user.id).tsearch(params[:term].downcase).limit(20).pluck("name")
  end

end