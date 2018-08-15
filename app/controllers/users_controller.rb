class UsersController < ApplicationController
    def search
        #route: users/search
        #conducts fetch to get meetup event data, returns json data
        #dummy location: longitude first, then latitude
        new_search = EventSearch.new(-74.00, 40.71)
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
    end

    def show
        #returns users all events
    end
end
