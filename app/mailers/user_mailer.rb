class UserMailer < ApplicationMailer
	def suspend_email(user)
		@user = user
		mail(to: @user.email, subject: 'Account Suspension')
	end
end