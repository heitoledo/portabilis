require 'rails_helper'

describe UserPolicy, type: :policy do
  let(:user) { create(:user, :user) }
  let(:admin) { create(:user, :admin) }

  subject { described_class }

  permissions :edit?, :new?, :update?, :deactivate?, :delete? do
    it { is_expected.to permit(admin) }
    it { is_expected.to_not permit(user) }
  end
end
