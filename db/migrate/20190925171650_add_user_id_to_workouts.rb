class AddUserIdToWorkouts < ActiveRecord::Migration[6.0]
  def change
    # add_reference :workouts, :user, null: false, foreign_key: true
    # can't do foreign key (users outside tenant's schema)
    add_column :workouts, :user_id, :integer, null: false, index: true
  end
end
