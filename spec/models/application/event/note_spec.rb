require 'rails_helper'

RSpec.describe Application::Event::Note, type: :model do
  it_behaves_like 'a Application::Event STI class'

  it 'has a `content` attribute' do
    note_event = create(:application_note_event, content: 'hello world')

    expect(note_event).to respond_to(:content)
    expect(note_event.content).to eq('hello world')
  end
end
