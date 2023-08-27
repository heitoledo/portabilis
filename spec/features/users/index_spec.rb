require 'rails_helper'

feature 'User index page' do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user, :user) }
  let!(:users) { create_list(:user, 2) }

  context 'as an admin' do
    before do
      sign_in admin
      visit users_path
    end

    scenario 'list users' do
      expect(page).to have_text users.first.name
      expect(page).to have_text users.last.name
    end

    scenario 'has the edit button visible' do
      expect(page).to have_content('Edit')
    end

    scenario 'has the destroy button visible' do
      expect(page).to have_content('Destroy')
    end

    scenario 'has the new user link visible' do
      expect(page).to have_content('New User')
    end
  end

  context 'as a normal user' do
    before do
      sign_in user
      visit users_path
    end

    scenario 'list users' do
      expect(page).to have_text users.first.name
      expect(page).to have_text users.last.name
    end

    scenario 'does not have the edit button visible' do
      expect(page).not_to have_content('Edit')
    end

    scenario 'does not have the destroy button visible' do
      expect(page).not_to have_content('Destroy')
    end

    scenario 'does not have the new user link visible' do
      expect(page).not_to have_content('New User')
    end
  end
end
