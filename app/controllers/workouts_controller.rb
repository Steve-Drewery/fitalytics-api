class WorkoutsController < ApplicationController
    before_action :authorize_request
    before_action :set_workout, only: [:show, :update, :destroy]

    # Get users workouts
    def index
        if params[:category]
            # Option to only show workouts from certain catagory; error no workouts if none exist
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


    # POST a workout; error if required entities are not entered
    def create
        @workout = @current_user.workouts.create(workout_params)
        if @workout.errors.any?
            render json: @workout.errors, status: :unprocessable_entity
        else
            #update total number of workouts if created successfully and show workout
            @current_user.update(total_workouts: @current_user.workouts.count)
            render json: @workout, status: 201
        end
    end

    # GET workout
    def show
        render json: @workout
    end

    # PUT workout; error if required params not processed
    def update
        @workout.update(workout_params)
        if @workout.errors.any?
            render json: @workout.errors, status: :unprocessable_entity
        else
            render json: @workout, status: 201
        end
    end

    # DELETE workout
    def destroy
        @workout.delete
        render json: 204
    end

    private

    def workout_params
        params.require(:workout).permit(:category_id, :description, :weight, :reps, :distance, :time, :avg_bpm, :date, :workout)
    end

    # Find workout by id; only filter through workouts created by user.
    def set_workout
        begin
            @workout = @current_user.workouts.find(params[:id])
        rescue
            render json: {error: "Workout not found"}, status: 404
        end
    end
end

