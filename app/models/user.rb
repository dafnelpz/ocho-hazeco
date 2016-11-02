class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :omniauthable, omniauth_providers: [:facebook]
  
  # ASSOCIATIONS
  belongs_to :role
  has_many :users
  has_many :deliveries, dependent: :destroy
  has_many :user_bags, through: :deliveries
  belongs_to :agent, foreign_key: :user_id, class_name: "User"
  
  # CALLBACKS
  before_save :set_default_role
  after_create :set_user_id, if: :is_agent?

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

  def to_s
    name
  end

  def last_delivery_chart
    deliveries.last.user_bags.map { |u| [u.bag, u.kg] }.to_h
  end

  def total_delivery_chart
    user_bags.joins(:bag).group("bags.color").sum(:kg).to_h
  end

  protected
    def set_default_role
      default = Role.find_by(user: true)
      self.role_id ||= default.id if default
    end

    def set_user_id
      update(user_id: id)
    end

    def is_agent?
      role.agent
    end

    def confirmation_required?
      role.user
    end

  end








