module TripsHelper
  def trip_date(t)
    return t.start_date.empty? ? "No specific date" : "#{obj.start_date} - #{obj.end_date}"
  end
end
