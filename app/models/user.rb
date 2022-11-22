class User < ApplicationRecord
    has_secure_password
    has_many :workouts, dependent: :destroy
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :weekly_goal, numericality: { greater_than: 0, less_than_or_equal_to: 7 }
end
