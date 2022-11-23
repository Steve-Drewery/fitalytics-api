class UsersController < ApplicationController
    before_action :authorize_request, except: :create # authorize request only on create
    before_action :set_weekly_workouts, only: [:index, :show] # counts workouts this week on index and show
    before_action :find_user, except: %i[create index] 

    
    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET /users/{username}
    def show
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
        @user.update(user_params)
        if @user.errors.any?
            render json: {errors: @user.errors.full_messages }, status: :unprocessable_entity
        else
            render json: @user, status: 201
        end
    end

    # DELETE /users/{username}
    def destroy 
        @user.destroy
    end 


    private

    # Locate user by username; error if username does not exist
    def find_user
        @user = User.find_by_username(params[:username])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def set_weekly_workouts
        @current_user.update!(workouts_this_week: @current_user.workouts.where(date: Date.today.beginning_of_week..).count)
    end

    def user_params
        params.permit(
            :name, :username, :email, :password, :password_confirmation, :weekly_goal
        )
    end
end
