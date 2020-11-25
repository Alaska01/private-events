require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Anything')
  end

  it 'will be invalid without a name ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'User associations' do
    it { should have_many(:events).without_validating_presence }
    it { should have_many(:attended_events).without_validating_presence }
  end
end
