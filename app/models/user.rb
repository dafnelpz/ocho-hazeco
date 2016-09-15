class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :omniauthable, omniauth_providers: [:facebook]
  
  # ASSOCIATIONS
  belongs_to :role
  has_many :users
  belongs_to :agent, foreign_key: :user_id, class_name: "User"
  
  # CALLBACKS
  before_save :set_default_role

  # METHODS
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

  protected
    def set_default_role
      default = Role.find_by(user: true)
      self.role_id ||= default.id if default
    end
end
