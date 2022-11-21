class LadderController < ApplicationController

    def index
        @users = User.reorder('GREATEST(total_workouts) DESC')
        render json: @users, status: :ok
    end
    
    def weight
        @users = Workout.where(category_id: 1).reorder('GREATEST(weight) DESC NULLS LAST')
        render json: @users, status: :ok
    end

    def swimming
        @users = Workout.where(category_id: 2).reorder('GREATEST(distance) DESC NULLS LAST')
        render json: @users, status: :ok
    end

    def running
        @users = Workout.where(category_id: 3).reorder('GREATEST(distance) DESC NULLS LAST')
        render json: @users, status: :ok
    end
end
