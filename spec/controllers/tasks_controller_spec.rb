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
  end
end