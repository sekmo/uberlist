require 'rails_helper'

RSpec.describe Project, type: :model do
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
