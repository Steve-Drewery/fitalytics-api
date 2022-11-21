class LadderController < ApplicationController
    def index
        @variables = []
        User.all.each do |user|
            count = user.workouts.count
            @variables.push([user,count])
        end
        @variables.sort_by {|var| var[1]}
        render json: @variables
    end
end
