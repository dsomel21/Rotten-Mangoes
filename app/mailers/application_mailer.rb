class ApplicationMailer < ActionMailer::Base
	default from: "from@example.com"
	# layout 'mailer'
	def account_suspend_email(user)
		@user = user
		mail(to: @user.email, subject: 'Your account has been suspended'
	end
end
