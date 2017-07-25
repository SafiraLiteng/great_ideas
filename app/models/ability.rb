class Ability
	include CanCan::Ability

	def initialize(user)

		user ||= User.new
		
		can [:edit, :update, :destroy], Idea do |idea|
			user == idea.user
		end

		can :destroy, Comment do |comment|
			user == comment.user
		end

		can :flag, Comment do |comment|
			user == comment.user
		end
	end
end
