class NdbController < ApplicationController
  before_action :set_ndb, only: [:show ]
  
  def index
    if params[:search]
      @fd_descs = FdDesc.search(params[:search])
    # else
    #   @fd_descs = FdDesc.order("long_desc desc").limit(10)
    end
  end
  
  def show
  end
  
  def copyitem
    logger.info "++++ try to find the ndb item ++++++++"
    f = FdDesc.find(params[:ndb_id])
    listitem = ListItem.new(
    user_id:          current_user.id,
    item_category_id: current_user.item_category_id || 19, 
    unit_id:          4, 
    brand_id:         1, 
    name:             f.long_desc, 
    identifier:       f.ndb_no, 
    price:            1,
    quantity:         1,
    store_id:         current_user.store_id || 1,
    list_type_id:     1,
    ndb_no:           f.ndb_no, 
    inbasket:         false,
    complete:         false,
    favorite:         false)
    logger.info "++++++++++ list item object created ++++++++++++++"
      
    if listitem.valid?
      logger.info "++++++++++ list item is valid ++++++++++++++"
        
      listitem.save
      logger.info "++++++++++ list item saved finally ++++++++++++++"
      redirect_to ndb_index_path, notice: "food item copied to shopping list"
    else
      logger.error "************* ERROR(s) ****************"
      listitem.errors.messages.each do |msg|
        logger.error "************      #{msg}     ************"
      end
      logger.info "++++ fav item import time is null or less than 4 hours ++++++++"
      redirect_to ndb_food_path(f), alert: "item already copied to wish list"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ndb
      @fd_desc = FdDesc.find(params[:ndb_id])
    end
    
end