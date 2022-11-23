class User < ApplicationRecord
    has_secure_password
    has_many :workouts, dependent: :destroy # destroys workouts bound to user if user is deleted
    validates :email, presence: true, uniqueness: true # ensures unique email
    validates :username, presence: true, uniqueness: true # ensures unique password
    validates :weekly_goal, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 7 } # ensures valid input 0-7
end
