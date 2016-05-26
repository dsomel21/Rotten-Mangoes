# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def suspend_mail_preview
		UserMailer.suspend_email(User.first)
	end
end