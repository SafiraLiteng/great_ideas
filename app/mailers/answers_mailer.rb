class AnswersMailer < ApplicationMailer

	def notify_ideas_owner(comment)
		# @idea = idea
		@comment = comment
		@user = @comment.user

		if @user
			mail(to: 'celinagentil@gmail.com', subject: 'Test Email')
		end
	end
end
