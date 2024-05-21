require 'rails_helper'

RSpec.describe Application::Event::Rejected, type: :model do
  it_behaves_like 'a Application::Event STI class'

  describe '#status' do
    it 'returns `rejected` status' do
      rejected_event = create(:application_rejected_event)

      expect(rejected_event.status).to eq('rejected')
    end
  end
end
