class LadderController < ApplicationController
    # def index
    #     @ranking = ranker()
    # end
    # private
    # def ranker
    #     variables = []
    #     User.all.each do |user|
    #         count = user.workouts.count
    #         variables.push([user,count])
    #     end
    #     variables.sort_by {|var| var[1]}
    # end
    # def self.call
    #     Post.find_by_sql ['
    #       SELECT
    #         user, description, workout_count,
    #       ntile(?) OVER (
    #         ORDER BY workout_count ASC
    #       ) AS popularity
    #       FROM posts']
    # end
end
