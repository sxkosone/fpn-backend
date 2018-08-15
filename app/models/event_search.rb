require 'net/http'
require 'open-uri'
require 'json'
require_relative '../../config/secrets'

class EventSearch
    #belongs_to :user --do we need this if no database persistence?
    attr_accessor :long, :lat
    def initialize(long, lat)
        @long = long
        @lat = lat
    end

    def get_search_results
        token = MeetupKey::API_KEY
        url="https://api.meetup.com/find/upcoming_events?&sign=false&photo-host=public&page=20&key=#{token}"

        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data = response.body
        meetups = JSON.parse(data)
        puts meetups
    end
end

# get_search_results