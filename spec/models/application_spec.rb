require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:job) }

    it { is_expected.to have_many(:events).dependent(:restrict_with_error) }
  end
end
