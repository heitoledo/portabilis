class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]

  def self.ransackable_attributes(auth_object = nil)
    ["active", "email", "name", "role"]
  end

  def ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
