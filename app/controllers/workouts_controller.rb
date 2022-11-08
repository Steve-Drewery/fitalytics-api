class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
        render json: @workouts
    end

    def create
        @workout = Workout.create(workout_params)
        if @workout.errors_any?
            render json: @workout.errors, status: 
end
