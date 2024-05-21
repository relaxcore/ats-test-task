require 'rails_helper'

RSpec.describe Job::Event, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:job) }
  end
end
