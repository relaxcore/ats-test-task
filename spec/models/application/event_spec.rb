require 'rails_helper'

RSpec.describe Application::Event, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:application) }
  end
end
