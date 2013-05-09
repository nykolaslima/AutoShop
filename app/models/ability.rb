class Ability
	include CanCan::Ability

	def initialize(user)
		if user.role == "admin"
			can [:approve], Anuncio
		end
	end
end
