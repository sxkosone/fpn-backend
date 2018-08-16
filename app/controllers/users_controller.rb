class UsersController < ApplicationController
    def search
        #route: users/search
        #does fetch to get meetup event data, returns json data
        #dummy location: longitude first, then latitude
        puts "latitude: #{params[:lat]}"
        puts "longitude: #{params[:long]}"
        
        new_search = EventSearch.new(params[:long], params[:lat])
        results = new_search.get_search_results
        render json: results
    end

    def create
        #create new user, save to database
    end

    def update 
        #update user
        #or create new event through user association
    end

    def destroy
        #delete the user
    end

    def show
        #returns users all events
    end
end
