# This is a Ruby class that takes in a row of CSV information, from the
# Train model's class method, and converts each column's data to the
# necessary format.

class CsvSeed
  attr_reader :current_time, :origin, :destination, :trip, :current_time, :status, :track, :scheduled_time
  def initialize(train)
    @train = train
    @trip = train[:trip]
    @destination = train[:destination]
    @current_time = Time.at(@train[:timestamp].to_i - 18000).strftime("%A,%m-%d-%Y,%l:%M %p")
    @origin = train[:origin]
    @scheduled_time = Time.at(@train[:scheduledtime].to_i - 18000).strftime("%l:%M %p")
    @track = train[:track].nil? ? "TBD" : train[:track]
  end

  def status
    if @train[:lateness].to_i > 0
      minutes = @train[:lateness].to_i/60
      "LATE #{minutes} MIN"
    else
      @train[:status].upcase
    end
  end
end

# Argument/CSV format looks like:
# [TimeStamp,Origin,Trip,Destination,ScheduledTime,Lateness,Track,Status]
# where times are in unix/epoch and lateness is in seconds

# EXAMPLE
# t = CsvSeed.new([1471864606,"North Station","307","Lowell",1471864860,600,,"Now Boarding"])
# =>
# t.current_time = "Monday,08-22-2016, 7:16 AM"
# t.origin = "North Station"
# t.trip = "307"
# t.destination = "Lowell"
# t.scheduled_time = " 7:21 AM"
# t.track = "TBD"
# t.status: "LATE 20 MIN"
