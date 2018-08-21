class SearchController < ApplicationController
    def index
        #very first and initial search of open events
        #does fetch to get meetup event data, returns json data
        #remember longitude first, then latitude
        puts "latitude: #{params[:lat]}"
        puts "longitude: #{params[:long]}"
        puts "category: #{params[:category]}"
        puts "text: #{params[:text]}"
        puts "radius: #{params[:radius]}" 
        new_search = EventSearch.new(params[:long], params[:lat], params[:radius], params[:category], params[:text], "open_events")
        results = new_search.get_search_results
        render json: results
    end

    def categories
        #route search/categories
        #returns a list of the 33 different meetup categories
        #example search url https://api.meetup.com/2/categories?&sign=true&photo-host=public&page=200
        new_search = EventSearch.new(0, 0, 5, nil, nil, "categories")
        results = new_search.category_search
        render json: results
    end

    
end
