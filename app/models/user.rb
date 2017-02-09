class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :books
	has_one :profile
	after_create :setup_profile

	protected

 def setup_profile
    profile = self.create_profile # or Profile.create(user_id: self.id)
  end
end
