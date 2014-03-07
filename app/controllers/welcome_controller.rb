class WelcomeController < ApplicationController
  def index
  	@recent_trips = Trip.most_recent.take(5)
  	@top_rated_trips = Trip.highest_rated.take(5)
  end
end