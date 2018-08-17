require 'net/http'
require 'open-uri'
require 'json'
require_relative '../../config/secrets'

#BASE_URL="https://api.meetup.com/2/open_events?"
BASE_URL="https://api.meetup.com/2/"

class EventSearch
    #belongs_to :user --do we need this if no database persistence?
    attr_accessor :long, :lat, :search_type
    def initialize(long, lat, search_type)
        @long = long
        @lat = lat
        @search_type = search_type
    end

    def get_search_results
        token = MeetupKey::API_KEY
        #note: page=20 determines how many results to return. We can up this!
        url=BASE_URL+"#{self.search_type}&sign=true&photo-host=public&lat=#{self.lat}&lon=#{self.long}&radius=5&page=20&key=#{token}"
        #url="https://api.meetup.com/2/open_events?&sign=true&photo-host=public&lat=38.91&lon=-77.02&radius=5&page=20&key=#{token}"
        puts "searching with this url: " + url
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data = response.body
        meetups = JSON.parse(data)
        return meetups
        #puts meetups
    end
end

