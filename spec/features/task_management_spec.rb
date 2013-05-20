feature "task management" do

  background do
    @task = create(:task)
    @completed_task = create(:completed_task)
  end

  scenario "view all tasks" do
    visit root_path
    click_link 'Tasks'
    expect(page).to have_content(@task.name)
    expect(page).to have_content(@completed_task.name)
  end

  scenario "view a task" do
    visit tasks_path
    click_link @task.name
    expect(page).to have_content(@task.name)
  end

  scenario "view incomplete tasks" do
    visit root_path
    click_link 'Incomplete Tasks'
    expect(page).to have_content(@task.name)
    expect(page).to_not have_content(@completed_task.name)
  end

  scenario "create a new task" do
    visit new_task_path
    fill_in "Name", :with => "My sample task"
    click_button "Save"
    expect(page).to have_text("Task was created")
  end

  scenario "edit a task" do
    visit task_path(@task)
    click_link "Edit"
    fill_in "Name", :with => "New task name"
    click_button "Save"
    expect(page).to have_text("Task was saved")
  end

  scenario "delete a task" do
    visit task_path(@task)
    expect { click_link 'Delete' }.to change(Task, :count).by(-1)
  end
end