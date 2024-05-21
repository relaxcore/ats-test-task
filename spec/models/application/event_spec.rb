require 'rails_helper'

RSpec.describe Application::Event, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:application) }
  end

  describe 'scopes' do
    context '#excluding_notes' do
      it 'returns all events excluding notes' do
        event1 = create(:application_interview_event)
        _event2 = create(:application_note_event)
        event3 = create(:application_hired_event)
        event4 = create(:application_rejected_event)
        _event5 = create(:application_note_event)

        expect(described_class.excluding_notes).to eq([event1, event3, event4])
      end
    end
  end

  describe '#status' do
    it 'raises NotImplemented error' do
      event = create(:application_event)

      expect { event.status }.to raise_error(NotImplementedError)
    end
  end
end
