require "rails_helper"

RSpec.describe Task, type: :model do
  describe "relationships" do
    it { should belong_to(:project) }
  end

  describe "validations" do
    it "is invalid without a content" do
      expect(build(:task, content: nil)).to_not be_valid
    end
  end
end
