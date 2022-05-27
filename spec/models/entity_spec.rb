require 'rails_helper'

RSpec.describe Entity, type: :model do
  
  subject {Entity.new(name: 'Bills', amount: 23, user_id: 1)}
  before { subject.save}

  it 'Should have correct name' do
    name = 'Bills'
    expect(name).to eq(subject.name)
  end

  it 'Should have the name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should have the amount present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should be an integer' do
    expect(subject.amount).to be_an Integer
  end

  it 'Amount should not be a string' do
    subject.amount = 'String'
    expect(subject).to_not be_valid
  end
end