require 'rails_helper'

RSpec.describe User, type: :model do
context 'validation test' do 

  it 'ensures first name presence' do
    user = User.new(last_name: "Blahblah", email: "sample@email.com").save
    expect(user).to eq(false) 
  end

  it 'ensures last name presence' do
    user = User.new(first_name: "Blah", email: "sample@email.com").save
    expect(user).to eq(false) 
  end

  it 'ensures email presence' do
    user = User.new(first_name: "Blah", last_name: "Blahblah").save
    expect(user).to eq(false) 
  end

  it 'should save successfully' do
    user = User.new(first_name: "Blah", last_name: "Blahblah", email: "sample@email.com", password: "111111").save
    expect(user).to eq(true) 
  end

end
end
