class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :total_workouts, default: 0
      t.integer :workouts_this_week, default: 0
      t.timestamps
    end
  end
end
