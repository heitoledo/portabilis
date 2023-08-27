require 'rails_helper'

feature 'User edit page' do
  let(:admin) { create(:user, :admin) }
  let!(:user) { create(:user, :user) }

  context 'as an admin' do
    before do
      sign_in admin
    end

    scenario 'edit user' do
      visit users_path

      click_on "edit_user_#{user.id}"
      fill_in "user_name", with:"John Doe"
      click_on "Update User"

      expect(user.reload.name).to eq('John Doe')
    end
  end
end
