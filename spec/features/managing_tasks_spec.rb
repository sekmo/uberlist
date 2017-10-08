require 'rails_helper'

RSpec.feature "Managing tasks", type: :feature do
  before do
    @project = FactoryGirl.create(:project, name: "Organize trip to Praga")
  end

  scenario "User adds a new Task" do
    visit project_path(@project.id)
    expect {
      fill_in "New task", with: "Pack the suitcase"
      click_button "Create Task"
    }.to change { @project.tasks.count }.by(1)
    expect(page).to have_content "Task was successfully created"
    expect(page).to have_content "Pack the suitcase"
  end

  scenario "User removes a Task" do
    FactoryGirl.create(:task, project: @project, content: "Buy tickets")
    visit project_path(@project.id)
    task_span = find("span", text: "Buy tickets")
    task_container = task_span.first(:xpath,".//..")
    expect {
      within task_container do
        click_link "Delete"
      end
    }.to change { @project.tasks.count }.by(-1)
    expect(page).to have_content "Task was successfully deleted"
    expect(page).not_to have_content "Buy tickets"
  end

  scenario "User marks a Task as complete" do
    task = FactoryGirl.create(:task, project: @project, content: "Buy tickets")
    visit project_path(@project.id)
    task_span = find("span", text: "Buy tickets")
    task_container = task_span.first(:xpath,".//..")
    expect {
      within task_container do
        click_link "Mark as complete"
      end
    }.to change { task.reload.completed }.from(false).to(true)
  end

  scenario "User marks a Task as incomplete" do
    task = FactoryGirl.create(:task, project: @project, content: "Buy tickets", completed: true)
    visit project_path(@project.id)
    task_span = find("span", text: "Buy tickets")
    task_container = task_span.first(:xpath,".//..")
    expect {
      within task_container do
        click_link "Mark as incomplete"
      end
    }.to change { task.reload.completed }.from(true).to(false)
  end

end
