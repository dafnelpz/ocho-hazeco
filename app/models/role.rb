class Role < ActiveRecord::Base
	has_many :users
	validates :admin, :agent, :user, uniqueness: true
end
