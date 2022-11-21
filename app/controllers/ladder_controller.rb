class LadderController < ApplicationController

    def index
        @users = User.reorder('GREATEST(total_workouts) DESC')
        render json: @users, status: :ok
    end
end
