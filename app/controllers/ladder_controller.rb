class LadderController < ApplicationController

    # GET ladder sorted by total workouts completed
    def index
        @users = User.reorder('GREATEST(total_workouts) DESC')
        render json: @users, status: :ok
    end
    
    # GET ladder/weight sorted by weight
    def weight
        @users = Workout.where(category_id: 1).reorder('GREATEST(weight) DESC NULLS LAST')
        render json: @users, status: :ok
    end

    # GET ladder/swimming sorted by distance
    def swimming
        @users = Workout.where(category_id: 2).reorder('GREATEST(distance) DESC NULLS LAST')
        render json: @users, status: :ok
    end

    # GET ladder/running sorted by distance
    def running
        @users = Workout.where(category_id: 3).reorder('GREATEST(distance) DESC NULLS LAST')
        render json: @users, status: :ok
    end
end
