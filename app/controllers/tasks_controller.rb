class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
end
