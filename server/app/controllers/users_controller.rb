class UsersController < ApplicationController
    def new
    	@user = User.new
    end

    def index
      @posts = Post.all
    end

    def show
   		@user = User.find(params[:id])
    	redirect_to root_url 
   	end

    def create
    	@user = User.new(user_params)

	  	if @user.save
        flash[:info] = "Account created! login to start posting and viewing memes"#"Please check your email to activate your account."
        redirect_to root_url
	  	else
	  		render "new"
	  	end
    end

	# Activates an account.
	def activate
		update_attribute(:activated,    true)
		update_attribute(:activated_at, Time.zone.now)
	end

	# Sends the activation email.
	def send_activation_email
		UserMailer.account_activation(self).deliver!
	end

  private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
