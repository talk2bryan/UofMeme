class Api::V1::SessionsController < Api::V1::BaseController
  def new
  end

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = User.find_by(email: user_email)

    if user && user.authenticate(params[:session][:password])
      self.current_user = @user
      render(
        json: Api::V1::SessionSerializer.new(@user, root: false).to_json,
        status: 201
      )
    else
      render json: { errors: "Invalid email or password" }, status: 401
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end