require 'rails_helper'

RSpec.describe Application::Event::Interview, type: :model do
  it_behaves_like 'a Application::Event STI class'

  it 'has a `interview_date` attribute of :datetime type' do
    datetime_now = DateTime.now
    interview_event = create(:application_interview_event, interview_date: datetime_now)

    expect(interview_event).to respond_to(:interview_date)
    expect(interview_event.interview_date).to eq(datetime_now)
  end
end
