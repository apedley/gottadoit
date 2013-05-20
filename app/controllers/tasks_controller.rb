class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def incomplete
    @tasks = Task.incomplete
    render 'index'
  end

  def complete
    @tasks = Task.complete
    render 'index'
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_url, :flash => { :notice => "Task was created." }
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task, :flash => { :notice => "Task was saved." }
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, :flash => { :notice => "Task was deleted." }
  end
end
