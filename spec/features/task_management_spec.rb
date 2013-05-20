feature "task management" do
  scenario "create a new task" do
    visit new_task_path
    fill_in "Name", :with => "My sample task"
    click_button "Create"
    expect(page).to have_text("Task was created")
  end
end