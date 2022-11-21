class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET /users/{username}
    def show
        @current_user.update(workouts_this_week: Workout.where(date: 1.week.ago..).count)
        render json: @user, status: :ok
    end

    # POST /users
    def create
        @user = User.create(user_params)
        if @user.save
            token = JsonWebToken.encode(user_id: @user.id)
            render json: {username: @user.username, token: token}, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PUT /users/{username}
    def update
        unless @user.update(user_params)
            render json: {errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # DELETE /users/{username}
    def destroy 
        @user.destroy
    end 


    private

    # Locate user by username; error if username does not exist
    def find_user
        @user = User.find_by_username!(params[:username])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(
            :name, :username, :email, :password, :password_confirmation
        )
    end
end
