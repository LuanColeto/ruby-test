class ApplicationController < ActionController::API

    def welcome
        render json: {hello: "Hello World, and welcome to my rails API"}
    end

    def encode_token(payload)
        JWT.encode(payload, 'ea23f344187e4d9ed161dc96331445e4')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]

            begin
                JWT.decode(token, 'ea23f344187e4d9ed161dc96331445e4', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil    
            end
        end
    end

    def logged_in_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!logged_in_user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end

end
