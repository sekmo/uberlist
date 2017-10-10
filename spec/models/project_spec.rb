require 'rails_helper'

RSpec.describe Project, type: :model do
  describe ".find_by_user" do
    let(:tom) { create(:user) }
    let(:jerry) { create(:user) }
    let(:jerry_project) { create(:project, user: jerry) }
    before do
      create(:project, user: tom)
      create(:project, user: tom)
      create(:project, user: tom)
    end

    it "returns the projects that belong to the user" do
      expect(Project.find_by_user(tom).count).to eq(3)
    end

    it "doesn't return the projects that belong other users" do
      expect(Project.find_by_user(tom)).to_not include(jerry_project)
    end
  end

  describe "relationships" do
    it { should have_many(:tasks) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it "is invalid without a name" do
      expect(build(:project, name: nil)).to_not be_valid
    end
  end
end
