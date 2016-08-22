require 'csv'
require 'open-uri'

class Train < ActiveRecord::Base
  # Made basic relation between train and origin
  # Train belongs to a station(origin)
  # Origin has many trains/destinations.
  validates :trip, presence: true
  validates :track, presence: true
  validates :destination, presence: true
  validates :status, presence: true
  validates :scheduled_time, presence: true
  belongs_to :origin

  def self.reseed(url)
    # When Train.reseed("url") is called it uses a CSV url passed to it to
    # repopulate the postgres database.
    Train.delete_all
    CSV.new(open(url), headers: true, header_converters: :symbol).each do |line|

      t = CsvSeed.new(line)

      Train.create!(
        track: t.track,
        destination: t.destination,
        status: t.status,
        scheduled_time: t.scheduled_time,
        origin_id: t.origin == "North Station" ? 1 : 2,
        trip: t.trip,
        current_time: t.current_time
      )
    end
  end
end
