class User < ApplicationRecord
    has_secure_password
    has_many :workouts, dependent: :destroy
    has_many :weekly_goal, dependant: :destroy
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
