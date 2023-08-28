require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    it 'returns a successful response when user is created' do
      expect {
        post :create, params: {
          user: {name: 'Joe', email: 'joe@example.com', password: 'password', active: true, role: 'admin'}
        }
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'POST #deactivate' do
    it 'changes the value of the active attributes' do
      user = create(:user, :admin)

      post :deactivate, params: { user_id: user.id }

      expect(user.reload.active).to eq(false)
      expect(response).to have_http_status(:ok)
    end

    it 'changes the value of the active attributes' do
      user = create(:user, :admin, active: false)

      post :deactivate, params: { user_id: user.id }

      expect(user.reload.active).to eq(false)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
