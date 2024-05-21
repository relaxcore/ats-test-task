require 'spec_helper'

shared_examples 'a Job::Event STI class' do
  it 'have attribute type' do
    expect(subject).to have_attribute :type
  end

  it 'initialize successfully as an instance of the described class' do
    expect(subject).to be_a_kind_of described_class
    expect(described_class.ancestors.include?(Job::Event)).to be_truthy
  end
end

shared_examples 'a Application::Event STI class' do
  it 'have attribute type' do
    expect(subject).to have_attribute :type
  end

  it 'initialize successfully as an instance of the described class' do
    expect(subject).to be_a_kind_of described_class
    expect(described_class.ancestors.include?(Application::Event)).to be_truthy
  end
end
