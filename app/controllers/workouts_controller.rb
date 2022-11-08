class WorkoutsController < ApplicationController
    before_action :authorize_request
    before_action :set_workout, only: [:show, :update, :destroy]
    def index
        if params[:category]
            puts "Searching for #{params[:category]}"
            @workouts = @current_user.workouts.find_by_catagory(params[:category])
            if @workouts.count == 0
                return render json: {error: "No workout of that category"}, status: 404
            end
        else
            @workouts = @current_user.workouts.all
        end
        render json: @workouts
    end

    def create
        @workout = @current_user.workouts.create(workout_params)
        if @workout.errors.any?
            render json: @workout.errors, status: :unprocessable_entity
        else
            render json: @workout, status: 201
        end
    end

    def show
        render json: @workout.transform_workout
    end

    def update
        @workout.update(workout_params)
        if @workout.errors.any?
            render json: @workout.errors, status: :unprocessable_entity
        else
            render json: @workout, status: 201
        end
    end

    def destroy
        @workout.delete
        render json: 204
    end

    private

    def workout_params
        params.require(:workout).permit(:category_id, :description, :weight, :reps, :distance, :time, :avg_bpm, :date, :workout)
    end

    def set_workout
        begin
            @workout = Workout.find(params[:id])
        rescue
            render json: {error: "Workout not found"}, status: 404
        end
    end
end

