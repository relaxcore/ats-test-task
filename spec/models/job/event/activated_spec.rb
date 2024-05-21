require 'rails_helper'

RSpec.describe Job::Event::Deactivated, type: :model do
  it_behaves_like 'a Job::Event STI class'
end
