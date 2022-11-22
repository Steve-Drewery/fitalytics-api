class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :weekly_goal, presence: true
end
