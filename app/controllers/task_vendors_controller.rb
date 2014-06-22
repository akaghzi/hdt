class TaskVendorsController < ApplicationController
  before_action :set_task_vendor, only: [:show, :edit, :update, :destroy]

  # GET /task_vendors
  # GET /task_vendors.json
  def index
    begin
      task = Task.find(params[:task_id])
      @task_vendors = TaskVendor.where(task_id: task.id)
    rescue      
      redirect_to tasks_path, alert: "Did not understand the command."
    end
  end

  # GET /task_vendors/1
  # GET /task_vendors/1.json
  def show
  end

  # GET /task_vendors/new
  def new
    @vendors = Vendor.where(user_id: current_user.id).order("name")
    @task_vendor = TaskVendor.new(task_id: params[:task_id])
  end

  # GET /task_vendors/1/edit
  def edit
    @vendors = Vendor.where(user_id: current_user.id).order("name")
  end

  # POST /task_vendors
  # POST /task_vendors.json
  def create
    @task_vendor = TaskVendor.new(task_vendor_params)

    respond_to do |format|
      if @task_vendor.save
        format.html { redirect_to task_path(@task_vendor.task_id), notice: 'Task vendor was successfully created.' }
        format.json { render :show, status: :created, location: @task_vendor }
      else
        format.html { render :new }
        format.json { render json: @task_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_vendors/1
  # PATCH/PUT /task_vendors/1.json
  def update
    respond_to do |format|
      if @task_vendor.update(task_vendor_params)
        format.html { redirect_to task_path(@task_vendor.task_id), notice: 'Task vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_vendor }
      else
        format.html { render :edit }
        format.json { render json: @task_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_vendors/1
  # DELETE /task_vendors/1.json
  def destroy
    task = @task_vendor.task_id
    @task_vendor.destroy
    respond_to do |format|
      format.html { redirect_to task_path(task), notice: 'Task vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task_vendor
    @task_vendor = TaskVendor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_vendor_params
    params.require(:task_vendor).permit(:task_id, :vendor_id, :job_detail, :price)
  end
end
