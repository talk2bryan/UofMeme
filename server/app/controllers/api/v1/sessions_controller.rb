class Api::V1::SessionsController < Api::V1::BaseController
  def new
  end

  def create
    #user = User.find_by(email: params[:email])

    user = User.find_by(
          email: params[:email]
        )&.authenticate(params[:password])

    if user 
      self.current_user = user
      render(
        json: Api::V1::SessionSerializer.new(user, root: false).to_json,
        status: 201
      )
    else
      render json: { errors: "Invalid email or password" }, status: 401
    end
  end

  private

  def session_params
   normalized_params.permit(:email, :password)
  end

end