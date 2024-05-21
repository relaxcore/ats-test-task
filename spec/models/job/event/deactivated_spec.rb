require 'rails_helper'

RSpec.describe Job::Event::Deactivated, type: :model do
  it_behaves_like 'a Job::Event STI class'

  describe '#status' do
    it 'returns `deactivated` status' do
      deactivated_event = create(:job_deactivated_event)

      expect(deactivated_event.status).to eq('deactivated')
    end
  end
end
