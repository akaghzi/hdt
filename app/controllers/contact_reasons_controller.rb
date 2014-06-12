class ContactReasonsController < ApplicationController
  before_action :set_contact_reason, only: [:show, :edit, :update, :destroy]

  # GET /contact_reasons
  # GET /contact_reasons.json
  def index
    @contact_reasons = ContactReason.all
  end

  # GET /contact_reasons/1
  # GET /contact_reasons/1.json
  def show
  end

  # GET /contact_reasons/new
  def new
    @contact_reason = ContactReason.new
    if current_user.admin && current_user.approved
      @catalogowner = true
    else
      redirect_to root_path, alert: "you are not authorized to access the requested resource."
    end
  end

  # GET /contact_reasons/1/edit
  def edit
  end

  # POST /contact_reasons
  # POST /contact_reasons.json
  def create
    @contact_reason = ContactReason.new(contact_reason_params)

    respond_to do |format|
      if @contact_reason.save
        format.html { redirect_to contact_reasons_path, notice: 'Contact reason was successfully created.' }
        format.json { render :show, status: :created, location: @contact_reason }
      else
        format.html { render :new }
        format.json { render json: @contact_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_reasons/1
  # PATCH/PUT /contact_reasons/1.json
  def update
    respond_to do |format|
      if @contact_reason.update(contact_reason_params)
        format.html { redirect_to contact_reasons_path, notice: 'Contact reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_reason }
      else
        format.html { render :edit }
        format.json { render json: @contact_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_reasons/1
  # DELETE /contact_reasons/1.json
  # def destroy
  #   @contact_reason.destroy
  #   respond_to do |format|
  #     format.html { redirect_to contact_reasons_url, notice: 'Contact reason was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_reason
      @contact_reason = ContactReason.find(params[:id])
      if current_user.admin && current_user.approved
        @catalogowner = true
      else
        redirect_to root_path, alert: "you are not authorized to access the requested resource."
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_reason_params
      params.require(:contact_reason).permit(:name)
    end
end
