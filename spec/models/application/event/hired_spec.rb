require 'rails_helper'

RSpec.describe Application::Event::Hired, type: :model do
  it_behaves_like 'a Application::Event STI class'

  it 'has a `hire_date` attribute of datetime type' do
    datetime_now = DateTime.now
    hired_event = create(:application_hired_event, hire_date: datetime_now)

    expect(hired_event).to respond_to(:hire_date)
    expect(hired_event.hire_date).to eq(datetime_now)
  end
end
