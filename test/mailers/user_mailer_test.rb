require 'test_helper'

class UserMailerTest < ActionMailer::Preview
	def user_mail_preview
		UserMailer.sample_email(User.first)
	end
end