class Admin::UsersController < ApplicationController

	before_action :require_admin
	# after_destroy :send_suspend_notification

	# def send_suspend_notification
	# 	UserMailer.suspend_email(@user).deliver_now
	# end

	# def require_admin
	# 	unless current_user.admin?
	# 		redirect_to root_path
	# 	end
	# end

	def index
		@users = User.page(params[:page]).per(10)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	# Admins can "switch to" any user. The app will be fooled into thinking that the other user is the one that is signed in.
	def impersonate
		session[:temp] = session[:user_id]
		session[:user_id] = params[:id]
		redirect_to root_pathreq
	end 

	def end_impersonation 
		# binding.pry
		session[:temp] = nil
		session[:user_id] = session[:temp]
		redirect_to root_path
		# Rails.logger.debug("thing")
		# render: "YABBA"
	end

	def user_params
		params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
	end	

end
