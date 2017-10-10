require 'rails_helper'

RSpec.feature "Managing projects", type: :feature do
  before do
    @user = create(:user)
    login_as @user, scope: :user
  end

  scenario "User adds a new Project" do
    visit projects_path
    click_link "create"
    expect {
      fill_in "New Project name", with: "Organize trip to Portugal"
      click_button "Create Project"
    }.to change { Project.count }.by(1)
    expect(page).to have_content "Project was successfully created"
    expect(page).to have_content "Organize trip to Portugal"
  end

  scenario "User removes a Project" do
    project = create(:project, name: "Organize trip to Praga", user: @user)
    visit projects_path
    click_link "Organize trip to Praga"
    expect {
      click_link "Delete Project"
    }.to change { Project.count }.by(-1)
    expect(page).to have_content "Project was successfully deleted"
    expect(page).not_to have_content "Organize trip to Praga"
  end
end
