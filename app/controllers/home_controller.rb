class HomeController < ApplicationController
  def index
    @workouts = Workout.all.limit(9)  if current_user
  end
end
