require 'rails_helper'

feature 'User new page' do
  let(:admin) { create(:user, :admin) }

  context 'as an admin' do
    before do
      sign_in admin
    end

    scenario 'create new user' do
      visit users_path

      click_on "new_user"
      fill_in "user_name", with:"John Doe"
      fill_in "user_email", with:"john@email.com"
      fill_in "user_password", with:"password"
      select 'admin', from: 'user_role'
      click_on "Create User"

      expect(page).to have_text('John Doe')
    end

    scenario 'when no field is filled' do
      visit users_path

      click_on "new_user"
      click_on "Create User"

      expect(page).to have_text("Email can't be blank")
      expect(page).to have_text("Password can't be blank")
    end

    scenario 'when the email field is not filled' do
      visit users_path

      click_on "new_user"
      fill_in "user_name", with:"John Doe"
      fill_in "user_password", with:"password"
      select 'admin', from: 'user_role'
      click_on "Create User"

      expect(page).to have_text("Email can't be blank")
    end

    scenario 'when the password field is not filled' do
      visit users_path

      click_on "new_user"
      fill_in "user_name", with:"John Doe"
      fill_in "user_email", with:"john@email.com"
      select 'admin', from: 'user_role'
      click_on "Create User"

      expect(page).to have_text("Password can't be blank")
    end
  end
end
