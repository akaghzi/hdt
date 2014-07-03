class TaskContractorsController < ApplicationController
  before_action :set_task_contractor, only: [:show, :edit, :update, :destroy]

  # GET /task_contractors
  # GET /task_contractors.json
  def index
    begin
      task = Task.find(params[:task_id])
      @task_contractors = TaskContractor.where(task_id: task.id)
    rescue      
      redirect_to tasks_path, alert: "Did not understand the command."
    end
  end

  # GET /task_contractors/1
  # GET /task_contractors/1.json
  def show
  end

  # GET /task_contractors/new
  def new
    begin
      @contractors = Contractor.where(user_id: current_user.id).order("name")
    rescue
      redirect_to new_contractor_path(user_id: current_user.id), alert: "There is no contractor listed as yet"
    end
    @task_contractor = TaskContractor.new(task_id: params[:task_id])
  end

  # GET /task_contractors/1/edit
  def edit
    @contractors = Contractor.where(user_id: current_user.id).order("name")
  end

  # POST /task_contractors
  # POST /task_contractors.json
  def create
    @task_contractor = TaskContractor.new(task_contractor_params)
    # task_id = @task_contractor.task_id
    # logger.debug "************* task contractor #{task_id} **********"
    respond_to do |format|
      if @task_contractor.save
        # logger.debug "************* task contractor create 2 **********"
        format.html { redirect_to task_path(@task_contractor.task_id), notice: 'Task contractor was successfully created.' }
        format.json { render :show, status: :created, location: @task_contractor }
      else
        # logger.debug "************* task contractor create 3 **********"
        # @task_contractor = TaskContractor.new(task_id: task_id)
        @contractors = Contractor.where(user_id: current_user.id).order("name")
        
        format.html { render :new }
        format.json { render json: @task_contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_contractors/1
  # PATCH/PUT /task_contractors/1.json
  def update
    respond_to do |format|
      if @task_contractor.update(task_contractor_params)
        format.html { redirect_to task_path(@task_contractor.task_id), notice: 'Task contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_contractor }
      else
        format.html { render :edit }
        format.json { render json: @task_contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_contractors/1
  # DELETE /task_contractors/1.json
  def destroy
    task = @task_contractor.task_id
    @task_contractor.destroy
    respond_to do |format|
      format.html { redirect_to task_path(task), notice: 'Task contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    task_contractor = TaskContractor.find(params[:task_contractor_id])
    task_contractor.update(complete: true)
    redirect_to task_path(task_contractor.task_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task_contractor
    @task_contractor = TaskContractor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_contractor_params
    params.require(:task_contractor).permit(:task_id, :contractor_id, :job_detail, :complete, :price)
  end
end
