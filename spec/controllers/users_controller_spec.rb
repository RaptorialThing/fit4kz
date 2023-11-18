# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE), not null
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string           default("")
#  last_name              :string           default("")
#  username               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
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
