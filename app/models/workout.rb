class Workout < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :time, presence: true
  validates :date, presence: true

  # Find workout sorted by category

  def self.find_by_catagory(input)
    category = Category.find_by(name: input.capitalize)
    return self.where(category: category)
  end
end
