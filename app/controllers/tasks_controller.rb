class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET projects/1/tasks
  def index
    @tasks = @project.tasks
  end

  # GET projects/1/tasks/1
  def show
  end

  # GET projects/1/tasks/new
  def new
    @task = @project.tasks.build
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to(@task.project, notice: 'Task was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @task.update(task_params)
      redirect_to(@task.project, notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  
  def destroy
    @task = Task.find(params[:id])
    @project = @task.project
    @task.destroy
  
    redirect_to project_path(@project), notice: "Task was successfully destroyed."
    # or if you want to show only tasks:
    # redirect_to project_tasks_path(@project), notice: "Task was successfully destroyed."
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :project_id)
    end
end
