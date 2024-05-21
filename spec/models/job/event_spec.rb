require 'rails_helper'

RSpec.describe Job::Event, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:job) }
  end

  describe '#status' do
    it 'raises NotImplemented error' do
      event = create(:job_event)

      expect { event.status }.to raise_error(NotImplementedError)
    end
  end
end
