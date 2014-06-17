class FavoriteItemsController < ApplicationController
  before_action :set_favorite_item, only: [:show, :edit, :update, :destroy]

  # GET /favorite_items
  # GET /favorite_items.json
  def index
    if params[:search]
      @favorite_items = FavoriteItem.where(user_id: current_user.id).search(params[:search]).order("name")
    else
      @favorite_items = FavoriteItem.where(user_id: current_user.id).order("name")
    end
    
  end

  # GET /favorite_items/1
  # GET /favorite_items/1.json
  def show
  end

  # GET /favorite_items/new
  def new
    @favorite_item = FavoriteItem.new(user_id: current_user.id)
  end

  # GET /favorite_items/1/edit
  def edit
  end

  # POST /favorite_items
  # POST /favorite_items.json
  def create
    @favorite_item = FavoriteItem.new(favorite_item_params)

    respond_to do |format|
      if @favorite_item.save
        format.html { redirect_to favorite_items_path, notice: 'Favorite item was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_item }
      else
        format.html { render :new }
        format.json { render json: @favorite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_items/1
  # PATCH/PUT /favorite_items/1.json
  def update
    respond_to do |format|
      if @favorite_item.update(favorite_item_params)
        format.html { redirect_to favorite_items_path, notice: 'Favorite item was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_item }
      else
        format.html { render :edit }
        format.json { render json: @favorite_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_items/1
  # DELETE /favorite_items/1.json
  def destroy
    @favorite_item.destroy
    respond_to do |format|
      format.html { redirect_to favorite_items_url, notice: 'Favorite item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def copyitem
    f = FavoriteItem.find(params[:favorite_item_id])
    if f.imported_at.nil? || f.imported_at >= Time.now-4.hour
      ListItem.create(
      user_id:          current_user.id,
      item_category_id: f.item_category_id, 
      unit_id:          f.unit_id, 
      brand_id:         f.brand_id, 
      name:             f.name, 
      identifier:       f.identifier, 
      price:            f.price,
      quantity:         f.quantity,
      store_id:         current_user.store_id,
      list_type_id:     1,
      inbasket:         false,
      complete:         false,
      favorite:         true)
      
      f.update(imported_at: Time.now)
      
      redirect_to favorite_items_path, notice: "item copied to wish list"
    else
      redirect_to favorite_items_path, alert: "item already copied to wish list"
    end
  end
  
  def copyallitems
    favoriteitems = FavoriteItem.where(user_id: current_user.id)
    fcount = 0
    favoriteitems.each do |f|
      if f.imported_at.nil? || f.imported_at >= Time.now-4.hour
        ListItem.create(
        user_id:          current_user.id,
        item_category_id: f.item_category_id, 
        unit_id:          f.unit_id, 
        brand_id:         f.brand_id, 
        name:             f.name, 
        identifier:       f.identifier, 
        price:            f.price,
        quantity:         f.quantity,
        store_id:         current_user.store_id,
        list_type_id:     1,
        inbasket:         false,
        complete:         false,
        favorite:         true)
      
        f.update(imported_at: Time.now)
        fcount = fcount + 1
      end
    end
    redirect_to list_items_path, notice: "#{fcount} favorite items copied to wish list"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_favorite_item
    @favorite_item = FavoriteItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def favorite_item_params
    params.require(:favorite_item).permit(:user_id, :item_category_id, :unit_id, :brand_id, :name, :identifier, 
    :price, :quantity, :imported_at)
  end
end