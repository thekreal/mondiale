module TripsHelper
  def trip_date(t)
    return t.start_date.empty? ? "No specific date" : "#{t.start_date} - #{t.end_date}"
  end
end
