class SuggestTermsController < ApplicationController
  def index
    # render json: %w[honey coffee egg]
    
    # autocomplete :fd_desc, :long_desc
    render json: FdDesc.tsearch(params[:term]).limit(10).pluck("long_desc")
  end
end
