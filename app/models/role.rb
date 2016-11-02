class Role < ActiveRecord::Base
	has_many :users
	# validates :admin, :agent, :user, uniqueness: true

	def to_s
		if user
  			"Usuario"
		elsif agent
			"Agente"
		elsif admin
			"Administrador"
		end
	end
end
