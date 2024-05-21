require 'rails_helper'

RSpec.describe Application::Event::Rejected, type: :model do
  it_behaves_like 'a Application::Event STI class'
end
