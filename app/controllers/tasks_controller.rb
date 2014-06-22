class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:search]
      @incompletetasks = Task.incomplete.where(user_id: current_user.id).search(params[:search]).order("name")
      @completetasks = Task.completed.where(user_id: current_user.id).search(params[:search]).order("name")
    else
      @incompletetasks = Task.incomplete.where(user_id: current_user.id).order("name")
      @completetasks = Task.completed.where(user_id: current_user.id).order("name")
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @materials = ListItem.where(task_id: @task.id)
    @task_vendors = TaskVendor.where(task_id: @task.id)
  end

  # GET /tasks/new
  def new
    @task = Task.new(user_id: current_user.id, complete: false)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :name, :detail, :target_date, :complete)
    end
end