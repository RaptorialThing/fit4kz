require 'rails_helper'

describe 'check view /api/v1/users/sign_up' do
  context 'see sign_up view form' do
    it 'show sign_up view form' do
        visit new_user_registration_path

        find('.email').set('test@test.com')
        find('.password').set('passwordpassword')
        fill_in 'user[password_confirmation]', with: "passwordpassword"
        fill_in 'user[first_name]', with: "Test"
        fill_in 'user[last_name]', with: "Test"
        fill_in 'user[username]', with: "test"

        click_on "Sign up"

        expect(page).to have_content("test@test.com")
    end
  end
end


