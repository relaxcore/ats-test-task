require 'rails_helper'

RSpec.describe Application::Event, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:application) }
  end

  describe 'scopes' do
    context '#interviews' do
      it 'returns all events that are interviews' do
        event1 = create(:application_interview_event)
        _event2 = create(:application_note_event)
        _event3 = create(:application_hired_event)
        _event4 = create(:application_rejected_event)
        event5 = create(:application_interview_event)

        expect(described_class.interviews).to eq([event1, event5])
      end
    end

    context '#notes' do
      it 'returns all events that are notes' do
        _event1 = create(:application_interview_event)
        event2 = create(:application_note_event)
        _event3 = create(:application_hired_event)
        _event4 = create(:application_rejected_event)
        event5 = create(:application_note_event)

        expect(described_class.notes).to eq([event2, event5])
      end
    end

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
