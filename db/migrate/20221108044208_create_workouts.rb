class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :description
      t.string :weight
      t.string :reps
      t.string :distance
      t.string :time
      t.string :avg_bpm
      t.date :date, :starts_at, :null => false, :default => Time.now
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
