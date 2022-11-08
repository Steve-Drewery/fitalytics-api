class Workout < ApplicationRecord
  belongs_to :category

  def self.find_by_catagory(input)
    category = Category.find_by(name: input.capitalize)
    return self.where(category: category)
  end
end
