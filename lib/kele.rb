require "httparty"

module Kele

    class KeleConnect
        include HTTParty

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

            response = KeleConnect.post("#{@bloc_api}/sessions", options)
            response["auth_token"]
        end
    end

end