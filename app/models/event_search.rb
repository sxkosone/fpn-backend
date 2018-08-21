require 'net/http'
require 'open-uri'
require 'json'

BASE_URL="https://api.meetup.com/2/"

class EventSearch
    #belongs_to :user --do we need this if no database persistence?
    attr_accessor :long, :lat, :search_type, :category_id, :text, :radius
    def initialize(long, lat, radius, category_id=nil, text=nil, search_type)
        @long = long
        @lat = lat
        @radius = radius
        @category_id = category_id
        @text = text
        @search_type = search_type
    end

    def get_search_results
        token = ENV["API_KEY"]
        #note: page=20 determines how many results to return. We can up this!
        category_string=""
        text_string=""
        if !self.category_id.nil? && self.category_id != "0"
            category_string="&and_text=True&category=#{self.category_id}"
        end

        if !self.text.nil? && self.text != ""
            text_string="&text=#{self.text}"
        end

        url=BASE_URL+"#{self.search_type}?&sign=true&text_format=plain&photo-host=public&lat=#{self.lat}&lon=#{self.long}&radius=#{self.radius}#{category_string}#{text_string}&page=50&key=#{token}"
        #example url="https://api.meetup.com/2/open_events?&sign=true&photo-host=public&lat=38.91&lon=-77.02&radius=5&page=20&key=#{token}"
        puts "searching with this url: " + url
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data = response.body
        meetups = JSON.parse(data)
        return meetups
        #puts meetups
    end

    def category_search
        #example search url https://api.meetup.com/2/categories?&sign=true&photo-host=public&page=200
        token = ENV["API_KEY"]
        url=BASE_URL+self.search_type+"?&sign=true&photo-host=public&page=50&key=#{token}"
        puts "searching with this url: " + url
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data = response.body
        categories = JSON.parse(data)
        return categories
    end
end

