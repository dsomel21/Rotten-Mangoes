# Preview all emails at http://localhost:3000/rails/mailers/user_mailer/suspend_mail_preview
class UserMailerPreview < ActionMailer::Preview
	def suspend_mail_preview
		UserMailer.suspend_email(User.first)
	end
end