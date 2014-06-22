class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    if params[:search]
      @vendors = Vendor.where(user_id: current_user.id).search(params[:search]).order("name")
    else
      @vendors = Vendor.where(user_id: current_user.id).order("name")
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new(user_id: current_user.id)
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendors_path, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendors_path, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:user_id, :name, :phone, :fax, :email, :description)
    end
end
