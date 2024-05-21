require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:job) }

    it { is_expected.to have_many(:events).dependent(:restrict_with_error) }
  end

  describe '#status' do
    it 'returns the status of the last event excluding Note' do
      application = create(:application)
      create(:application_interview_event, application: application)
      create(:application_note_event, application: application)
      create(:application_hired_event, application: application)
      create(:application_note_event, application: application)

      expect(application.status).to eq('hired')
    end

    it 'returns `applied` if there are no events' do
      application = create(:application)

      expect(application.status).to eq('applied')
    end
  end
end
