RSpec.describe UsersController, type: :controller do
  before :each do
    @test_user = create(:user)
  end

  describe "POST #/api/v1/registrations" do
    context "with valid attributes" do
      it "creates a new user" do
        post :register, params: { email: "newuser@email.com", password: "newuser123" }

        expect(response.status).to eq '201'
        expect(User.find_by(email: "newuser@email.com")).to be_truthy
      end
    end

    context "with invalid attributes" do
      it "does not create without email field" do
        post :register, params: { password: @test_user["password"] }

        expect(JSON.parse(response.status)).to eq '415'
      end

      it "does not create duplicate user" do
        post :register, params: { email: @test_user["email"], password: @test_user["password"] }

        expect(JSON.parse(response.status)).to eq '409'
      end
    end
  end
end
