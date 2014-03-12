class WelcomeController < ApplicationController
  def index
  	@recent_trips = Trip.most_recent.take(5)
  end
end