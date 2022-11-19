require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET /index" do
    it "returns a successfull response" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  
  # it 'count users as expected' do
  #   get :index
  #   users = JSON.parse(response.body)
  #   expect(users.count).to expect(13)
  # end
  
  context "GET /show" do
    it "returns a successfull response" do
      user = User.create!(first_name: "Blah", last_name: "Blahblah", email: "sample@email.com", password: "111111")
      get :show,  params: {id: user.to_param}
      expect(response).to have_http_status(:ok)
    end
  end
end