class UsersController < ApplicationController
   
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authorized, only:[:update, :destroy, :show]
    


    def create
        #create new user, save to database
    end

    def update 
      
        params1 = params.require(:user).permit(:userId, event:{})
        event = Event.find_or_create_by(params1["event"])
        current_user.events << event
        render json: current_user
    end

    def destroy
        #delete the user
    end


    def login
        user = User.find_by(username: params[:username])
        password = params[:password]
        #confirms that the user exists and password is correct sets token if user is correct
        if user && user.authenticate(password)
            render json: {success: true, token: generate_token(user), user_id: user.id}
        else
            render json: {success: false}
        end
    end


    def show
     
        render json: current_user
       
    end


    private



    def generate_token(user)
        alg = 'HS256'
        payload = {user_id: user.id }
        secret = "thisIsLowBudget"
        JWT.encode payload, secret, alg
    end
    
    #this returns nill if the jwt_token is not present in the request
    def current_user
        authenticate_or_request_with_http_token do |jwt_token, options|
            begin
                decoded_token = JWT.decode(jwt_token, "thisIsLowBudget")
            
            rescue JWT::DecodeError
                return nil
            end 

            if decoded_token[0]["user_id"]
                @current_user ||= User.find(decoded_token[0]["user_id"])
            else
            end
        end
    end

    #returns false if the user is not logged
    def logged_in?
        !!current_user
    end 

    #returns a 401 message if the user is not logged in.
    def authorized
    
        puts "Thow Shall Not Pass"
        render json: {message: "Thow Shall Not Pass"}, status: 401 unless logged_in?
    end

end
