class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :omniauthable, omniauth_providers: [:facebook]
  belongs_to :role
  has_and_belongs_to_many :user
  has_many :agents, foreign_key: :agent_id

  	def self.find_for_facebook_oauth(auth)
		user = User.where(provider: auth.provider, uid: auth.uid).first
		# The User was found in our database
		return user if user
		# Check if the User is already registered without Facebook
		user = User.where(email: auth.info.email).first
		return user if user
		User.create(
  			name: auth.extra.raw_info.name,
  			provider: auth.provider, uid: auth.uid,
  			email: auth.info.email,
  			password: Devise.friendly_token[0,20])
  	end
end
