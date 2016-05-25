class Admin::UsersController < ApplicationController

	before_action :require_admin

	def require_admin
		unless current_user.admin?
			redirect_to root_path
		end
	end

	def index
		@users = User.page(params[:page]).per(10)
	end
	
	protected

	def user_params
	  params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
	end	

end
