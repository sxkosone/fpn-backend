require 'net/http'
require 'open-uri'
require 'json'
require_relative '../../config/secrets'

BASE_URL="https://api.meetup.com/2/open_events?"

class EventSearch
    #belongs_to :user --do we need this if no database persistence?
    attr_accessor :long, :lat
    def initialize(long, lat)
        @long = long
        @lat = lat
    end

    def get_search_results
        token = MeetupKey::API_KEY
        #old url="https://api.meetup.com/find/upcoming_events?&sign=false&photo-host=public&page=20&key=#{token}"
        url=BASE_URL+"&sign=true&photo-host=public&lat=#{self.lat}&lon=#{self.long}&radius=5&page=20&key=#{token}"
        #url="https://api.meetup.com/2/open_events?&sign=true&photo-host=public&lat=38.91&lon=-77.02&radius=5&page=20&key=#{token}"
        puts url
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data = response.body
        meetups = JSON.parse(data)
        return meetups
        #puts meetups
    end
end

