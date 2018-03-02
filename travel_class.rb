require 'geocoder'

Geocoder.configure(
  # geocoding service:
  :lookup => :google,
  # IP address geocoding service:
  :ip_lookup => :maxmind,
  # to use an API key:
  :api_key => 'AIzaSyCOY0d-CI7n6D_N4F9-yc60IaUANs7eJgc',
  # this is very important option for configuring geocoder with API key
  :use_https => true,
  # geocoding service request timeout, in seconds (default 3):
  :timeout => 300,
  # set default units to kilometers:
  :units => :km,
)
# Travel class uses geocoder for calclulating distance taking the end location as input
# class can later be modified to allow change of start locaion, price per km
class Travel
  attr_accessor :travel_cost, :distance

  def initialize (end_location)

    start_location = Geocoder.coordinates("brisbane")
    end_location_coordinates = Geocoder.coordinates(end_location)
    # works out distance traveled from start location to end location
    @distance = Geocoder::Calculations.distance_between(start_location, end_location_coordinates)
    # works out cost per km
    @travel_cost = (distance * 1.2).round(2)
  end
end
