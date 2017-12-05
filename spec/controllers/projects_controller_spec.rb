require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "GET index" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "redirects to the login" do
        get :index
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe "GET show" do
    context "as an authorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom)
      end

      it "responds successfully" do
        sign_in @tom
        get :show, params: {id: @tom_project.id}
        expect(response).to have_http_status "200"
      end
    end

    context "as an unauthorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom)
        @jerry = create(:user)
      end

      it "redirects to the root" do
        sign_in @jerry
        get :show, params: {id: @tom_project.id}
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @project = create(:project)
      end
      it "redirects to the login" do
        get :show, params: {id: @project.id}
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe "POST create" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      context "with valid attributes" do
        it "creates a new project" do
          project_params = attributes_for(:project)
          sign_in @user
          expect {
            post :create, params: {project: project_params}
          }.to change(@user.projects, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "doesn't create a new project" do
          project_params = attributes_for(:project, :invalid)
          sign_in @user
          expect {
            post :create, params: {project: project_params}
          }.to_not change(@user.projects, :count)
        end
      end
    end

    context "as a guest" do
      it "redirects to the login" do
        project_params = attributes_for(:project)
        post :create, params: {project: project_params}
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe "PATCH update" do
    context "as an authorized user" do
      before do
        @user = create(:user)
        @project = create(:project, user: @user, name: "Original project name")
      end

      context "with valid attributes" do
        it "updates a project" do
          project_params = attributes_for(:project, name: "New project name")
          sign_in @user
          patch :update, params: {id: @project.id, project: project_params}
          expect(@project.reload.name).to eq "New project name"
        end
      end

      context "with invalid attributes" do
        it "doesn't update a project" do
          project_params = attributes_for(:project, name: nil)
          sign_in @user
          patch :update, params: {id: @project.id, project: project_params}
          expect(@project.reload.name).to eq "Original project name"
        end
      end
    end

    context "as an unauthorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom, name: "Original project name")
        @jerry = create(:user)
      end

      it "doesn't update the project" do
        project_params = attributes_for(:project, name: "New Project Name")
        sign_in @jerry
        patch :update, params: {id: @tom_project.id, project: project_params}
        expect(@tom_project.reload.name).to eq "Original project name"
      end

      it "redirects to the root" do
        project_params = attributes_for(:project)
        sign_in @jerry
        patch :update, params: {id: @tom_project.id, project: project_params}
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @project = create(:project)
      end

      it "redirects to the login" do
        project_params = attributes_for(:project)
        patch :update, params: {id: @project.id, project: project_params}
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe "DELETE destroy" do
    context "as an authorized user" do
      before do
        @user = create(:user)
        @project = create(:project, user: @user)
      end

      it "deletes a project" do
        sign_in @user
        expect {
          delete :destroy, params: {id: @project.id}
        }.to change(@user.projects, :count).by(-1)
      end
    end

    context "as an unauthorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom)
        @jerry = create(:user)
      end

      it "does not delete the project" do
        sign_in @jerry
        expect {
          delete :destroy, params: {id: @tom_project.id}
        }.to_not change(Project, :count)
      end

      it "redirects to the root" do
        sign_in @jerry
        delete :destroy, params: {id: @tom_project.id}
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @project = create(:project)
      end

      it "redirects to the login" do
        delete :destroy, params: {id: @project.id}
        expect(response).to redirect_to new_user_session_url
      end

      it "does not delete the project" do
        expect {
          delete :destroy, params: {id: @project.id}
        }.to_not change(Project, :count)
      end
    end
  end


  describe "GET new" do
    context "as an authenticated user" do
      before do
        @user = create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "redirects to the login" do
        get :index
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe "GET edit" do
    context "as an authorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom, name: "Original project name")
      end

      it "responds successfully" do
        sign_in @tom
        get :edit, params: {id: @tom_project.id}
        expect(response).to have_http_status "200"
      end
    end

    context "as an unauthorized user" do
      before do
        @tom = create(:user)
        @tom_project = create(:project, user: @tom)
        @jerry = create(:user)
      end

      it "redirects to the root" do
        sign_in @jerry
        get :edit, params: {id: @tom_project.id}
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @project = create(:project)
      end

      it "redirects to the login" do
        get :edit, params: {id: @project.id}
        expect(response).to redirect_to new_user_session_url
      end
    end
  end
end
