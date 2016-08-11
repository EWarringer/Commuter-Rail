class OriginsController < ApplicationController
  def index
    # variable for index page (../app/views/origins/index.erb)
    @stations = Origin.all
  end

  def show
    # Every time this show page is loaded (north or south station depending
    # what is clicked), it will reseed the information to the database
    # to provide the most updated data to the schedule. (see ../app/models/train.rb)
    Train.reseed("http://developer.mbta.com/lib/gtrtfs/Departures.csv")
    sleep 1
    # using the unix time provided in the CSV instead of using the Time constant
    @current = Train.first.current_time.split(",")
    @c_day = @current[0]
    @c_date = @current[1]
    @c_time = @current[2]

    # setting variables to use in the ERB
    @station = Origin.find(params[:id])

    @trains = @station.trains.all
    # binding.pry
  end
end
