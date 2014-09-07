class ListItemsController < ApplicationController
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @totalprice = 0.00
    if params[:search]
      @basketedlists = ListItem.basketed.where(user_id: current_user.id).search(params[:search]).order("name")
      @unbasketedlists = ListItem.unbasketed.where(user_id: current_user.id).search(params[:search]).order("item_category_id, name")
      @completedlists = ListItem.completed.where(user_id: current_user.id).search(params[:search]).order("name")
    else
      @basketedlists = ListItem.basketed.where(user_id: current_user.id).order("name")
      @unbasketedlists = ListItem.unbasketed.where(user_id: current_user.id).order("item_category_id, name")
      @completedlists = ListItem.completed.where(user_id: current_user.id).order("name")
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    # if params[:search]
    #   @fd_descs = FdDesc.search(params[:search])
    # else
    #   @fd_descs = FdDesc.order("long_desc desc").limit(10)
    # end
    @list_item = ListItem.new(user_id: current_user.id, 
                              store_id: current_user.store_id, 
                              brand_id: current_user.brand_id, 
                              item_category_id: current_user.item_category_id, 
                              unit_id: current_user.unit_id, 
                              list_type_id: 1, 
                              inbasket: false,
                              task_id: params[:task_id] )
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list_item = ListItem.new(list_item_params)
    logger.info "++++++++++ creating list items ++++++++++++++"
    respond_to do |format|
      if @list_item.save
        logger.info "++++++++++ list item saved ++++++++++++++"
        if @list_item.task_id
          format.html { redirect_to task_path(@list_item.task_id)}#, notice: 'List item was successfully added.' }
        end
        format.html { redirect_to list_items_path}#, notice: 'List item was successfully added.' }
        format.json { render :show, status: :created, location: @list_item }
      else
        logger.info "++++++++++ list item NOT saved ++++++++++++++"
        format.html { render :new }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
          if @list_item.task_id
            format.html { redirect_to task_path(@list_item.task_id)}#, notice: 'List item was successfully updated.' }
          end
        format.html { redirect_to list_items_path}#, notice: 'List item was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list_item.destroy
    respond_to do |format|
      format.html { redirect_to list_items_url}#, notice: 'ListItem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def putinbasket
    begin
      list_item = ListItem.unbasketed.find_by(id: params[:list_item_id], user_id: current_user.id)
    rescue
      logger.error "******** Error **********"
      logger.error "list_item: #{list_item}"
      logger.error "******** Error **********"
    end
    list_item.update(inbasket: true)
    redirect_to list_items_path#, notice: "Item successfully tranferred to basket"
  end

  def takeoutofbasket
    begin
      list_item = ListItem.find_by(id: params[:list_item_id], user_id: current_user.id, inbasket: true)
    rescue
      logger.error "******** Error **********"
      logger.error "list_item: #{list_item}"
      logger.error "******** Error **********"
    end
    list_item.update(inbasket: false)
    redirect_to list_items_path#, alert: "Item successfully removed to basket"
  end

  def complete
    begin
      list_item = ListItem.find_by(id: params[:list_item_id], user_id: current_user.id, inbasket: true)
    rescue
      logger.error "******** Error **********"
      logger.error "list_item: #{list_item}"
      logger.error "******** Error **********"
    end
    if list_item.price.nil?
      list_item.update(inbasket: nil, complete: true)
      redirect_to list_items_path, alert: "No valid price entered for item marked complete"
    else
      list_item.update(inbasket: nil, complete: true)
      redirect_to list_items_path#, notice: "Item successfully paid for and removed from basket"
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list_item
    begin
      @list_item = ListItem.find_by(id: params[:id], user_id: current_user.id)
    rescue
      logger.error "******** Error **********"
      logger.error "list_item: #{@list_item}"
      logger.error "******** Error **********"
      redirect_to root_path, alert: "You do not have access to requested resource"
    end    
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_item_params
    params.require(:list_item).permit(:user_id, :list_type_id, :item_category_id, :unit_id, :store_id, :brand_id, :task_id, :name, 
    :identifier, :price, :quantity, :favorite, :inbasket, :complete)
  end
end