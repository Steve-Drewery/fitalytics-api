class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    # POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username }, status: :ok
        else
            render json: { error: 'Unauthorized'}, status: :unauthorized    
        end
    end

    private 

    # Require email and password for login, error if not completed
    def login_params
        params.permit(:email, :password)
    end

end