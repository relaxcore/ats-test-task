require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:applications).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:events).dependent(:restrict_with_error) }
  end

  describe '#status' do
    it 'returns the status of the last event' do
      job = create(:job)
      create(:job_activated_event, job: job)
      create(:job_deactivated_event, job: job)
      create(:job_activated_event, job: job)

      expect(job.status).to eq('activated')
    end

    it 'returns `deactivated` if there are no events' do
      job = create(:job)

      expect(job.status).to eq('deactivated')
    end
  end
end
