require "httparty"

module Kele

    class KeleConnect

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
    end

end