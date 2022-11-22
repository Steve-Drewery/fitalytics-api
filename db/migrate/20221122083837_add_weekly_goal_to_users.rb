class AddWeeklyGoalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :weekly_goal, :integer, default: 0
  end
end
