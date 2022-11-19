require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do 
    before(:each) do
      user = create(:user)
    end
    
    it 'ensures first name presence' do
      user = User.new(last_name: "Blahblah", email: "sample@email.com").save
      expect(user).to eq(false) 
    end
    
    # it 'last name should be string' do
    #   user = User.new(first_name: "Blah", last_name: "Blahblah", email: "sample@email.com", password: "111111").save
    #   expect(user.last_name).to be_a_kind_of(String)
    
    # end
    
    
    it 'should have ine item created after being created' do
      expect(User.all.count).to eq(14)
    end
    
    it 'ensures last name presence' do
      user = User.new(first_name: "Blah", email: "sample@email.com").save
      expect(user).to eq(false) 
    end
    
    it 'ensures email presence' do
      user = User.new(first_name: "Blah", last_name: "Blahblah").save
      expect(user).to eq(false) 
    end
    
    it 'should not let user to be created without password' do
      user = User.new(first_name: "Blah", last_name: "Blahblah", email: "sample@email.com").save
      expect(user).to_not be(true)
    end
    
    it 'should save successfully' do
      user = User.new(first_name: "Blah", last_name: "Blahblah", email: "sample@email.com", password: "111111").save
      expect(user).to eq(true) 
    end
    
    # factory bot -----------------
    
    it 'should be valid' do
      user = create(:user)
      expect(user).to be_valid
    end
    
  end
end
