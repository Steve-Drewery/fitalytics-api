class Workout < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :time, presence: true
  validates :date, presence: true

  def self.find_by_catagory(input)
    category = Category.find_by(name: input.capitalize)
    return self.where(category: category)
  end

  def transform_workout
    return {
      name: self.user.name,
      username: self.user.username,
      email: self.user.email,
      category: self.category.name,
      description: self.description,
      posted: self.created_at,
      edited: self.updated_at
    }
  end
end
