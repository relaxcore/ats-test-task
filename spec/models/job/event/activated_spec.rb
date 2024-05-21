require 'rails_helper'

RSpec.describe Job::Event::Activated, type: :model do
  it_behaves_like 'a Job::Event STI class'

  describe '#status' do
    it 'returns `activated` status' do
      activated_event = create(:job_activated_event)

      expect(activated_event.status).to eq('activated')
    end
  end
end
