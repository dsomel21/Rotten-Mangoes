class Admin::UsersController < ApplicationController

	# after_destroy :send_suspend_notification
	before_action :require_admin

	# def send_suspend_notification
	# 	UserMailer.suspend_email(@user).deliver_now
	# end

	def require_admin
		unless current_user.admin?
			redirect_to root_path
		end
	end

	def index
		@users = User.page(params[:page]).per(10)
	end

	def destroy 
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

	def impersonate
		byebug
		session[:admin_id] = session[:current_user]
	end

	protected

	def user_params
		params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
	end	

end
