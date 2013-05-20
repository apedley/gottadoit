require 'spec_helper'

describe TasksController do
  describe "GET #index" do
    it "populates an array  of tasks" do
      task = create(:task)
      get :index
      expect(assigns(:tasks)).to eq [task]
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #incomplete" do
    it "populates an array of incomplete tasks" do
      task = create(:task)
      completed_task = create(:completed_task)
      get :incomplete
      expect(assigns(:tasks)).to_not include(completed_task)
    end
  end

  describe "GET #show" do
    it "assigns the requested task to @task" do
      task = create(:task)
      get :show, id: task
      expect(assigns(:task)).to eq task
    end

    it "renders the #show view" do
      get :show, id: create(:task)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested task to @task" do
      task = create(:task)
      get :edit, id: task
      expect(assigns(:task)).to eq task
    end

    it "renders the :edit view" do
      task = create(:task)
      get :edit, id: task
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new task in the database" do
        expect{
          post :create, task: attributes_for(:task)
        }.to change(Task, :count).by(1)
      end

      it "redirects to the task index" do
        post :create, task: attributes_for(:task)
        expect(response).to redirect_to tasks_url
      end
    end
    context "with invalid attributes" do
      it "does not save the new task" do
        expect{
          post :create, task: attributes_for(:invalid_task)
        }.to_not change(Task, :count)
      end

      it "re-renders the new template" do
        post :create, task: attributes_for(:invalid_task)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @task = create(:task, name: 'Starting name', completed: false)
    end

    it "locates the requested @task" do
      put :update, id: @task, task: attributes_for(:task)
      expect(assigns(:task)).to eq(@task)
    end

    context "valid attributes" do
      it "changes @task's attributes" do
        put :update, id: @task, task: attributes_for(:task, name: "Updated name")
        @task.reload
        expect(@task.name).to eq("Updated name")
      end

      it "redirects to the updated task" do
        put :update, id: @task, task: attributes_for(:task)
        expect(response).to redirect_to @task
      end
    end

    context "invalid attributes" do
      it "does not change @tasks attributes" do
        put :update, id: @task, task: attributes_for(:task, name: "Failure", completed: nil)
        @task.reload
        expect(@task.name).to_not eq("Failure")
      end

      it "re-renders the edit method" do
        put :update, id: @task, task: attributes_for(:invalid_task)
        expect(response).to render_template :edit
      end 
    end
  end

  describe "DELETE destroy" do
    before :each do
      @task = create(:task)
    end

    it "deletes the task" do
      expect{
        delete :destroy, id: @task
      }.to change(Task,:count).by(-1)
    end

    it "redirects to tasks#index" do
      delete :destroy, id: @task
      expect(response).to redirect_to tasks_url
    end
  end
end