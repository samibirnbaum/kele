require "httparty"
require_relative "kele/roadmap"

class Kele

    include RoadmapMethods

    def initialize(username, password)
        @bloc_api = "https://www.bloc.io/api/v1"
        @authenticaition_token = retrieve_authentication_token(username, password) 
    end

    def retrieve_authentication_token(username, password)
        options = {
            body: {
                email:  username,
                password: password
            }
        }

        response = HTTParty.post("#{@bloc_api}/sessions", options)
        
        response.ok? ? (response["auth_token"]) : (raise "invalid email or password") 
    end

    def get_me
        response = HTTParty.get("#{@bloc_api}/users/me", headers: {authorization: @authenticaition_token})
        response.ok? ? (response) : (raise "Error retrieving current_user")
    end

    def get_mentor_availability(mentor_id)
        response = HTTParty.get("#{@bloc_api}/mentors/#{mentor_id}/student_availability", headers: {authorization: @authenticaition_token})
        response.ok? ? (response) : (raise "Error retrieving mentor_availability")
    end
end