class LadderController < ApplicationController
    def index
        @ranking = ranker()
    end
    private
    def ranker
        variables = []
        Workout.where.not(weight: nil) do |weight|
            variables.push[weight]
        end
        variables.sort_by {var}
    end
end
