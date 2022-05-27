require 'rails_helper'

RSpec.describe Category, type: :model do
  subject {Category.new(name: 'Neutral')}
  before { subject.save}

  it 'Should have correct name' do
    name = 'Neutral'
    expect(name).to eq(subject.name)
  end

  it 'Should have the name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end