class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:search]
      @products = Product.search(params[:search]).order("identifier")
    else
      @products = Product.order("updated_at desc").limit 10
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    if current_user.admin && current_user.approved
    else
      redirect_to root_path, alert: "You do not have access to requested resource."
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def lookup
    upc = params[:product_id]
    @product = Product.find(params[:product_id])
    if @product.detail.nil?
      opennutritionURI="http://www.opennutritiondatabase.com/foods/#{upc}.json"
      response = Net::HTTP.get_response(URI.parse(opennutritionURI))
      logger.info "response = #{response}"
      if response.code == "200"
        data = response.body
        @product.update(detail: response.body)
        redirect_to @product
      else
        redirect_to products_path, alert: "UPC not found in our database, or UPC is related to non-food product"
      end
    else
      redirect_to @product
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  # def destroy
  #   @product.destroy
  #   respond_to do |format|
  #     format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:identifier, :detail)
    end
end
