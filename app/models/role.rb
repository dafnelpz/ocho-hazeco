class Role < ActiveRecord::Base
	has_many :users
	# validates :admin, :agent, :user, uniqueness: true

	def to_s
		if user
  			"User"
		elsif agent
			"Agent"
		elsif admin
			"Admin"
		end
	end
end
