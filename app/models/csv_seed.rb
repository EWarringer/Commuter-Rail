class CsvSeed
  attr_reader :current_time, :origin, :destination, :trip, :current_time, :status, :track, :scheduled_time
  def initialize(train)
    @train = train
    @trip = train[:trip]
    @destination = train[:destination]
    @current_time = Time.at(@train[:timestamp].to_i - 14400).strftime("%A,%m-%d-%Y,%l:%M %p")
    @origin = train[:origin]
    @scheduled_time = Time.at(@train[:scheduledtime].to_i - 14400).strftime("%l:%M %p")
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
