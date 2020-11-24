require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {
    described_class.new(name: "Graduation Party",
                        location: "Zoom",
                        description: "All diligent students wil be given an award .....",
                        date:"01-12-2020",
                        creator_id: 4)
  }


  it "will be invalid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a location" do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it "a must for event description to be valid" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  describe "Event associations" do
    it { should have_many(:invitations).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
    it { should belong_to(:creator).without_validating_presence }
  end
end
