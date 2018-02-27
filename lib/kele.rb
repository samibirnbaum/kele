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
            if response.ok?
                #inform user
                response["auth_token"] 
            else
                #inform user - prompt retry 
                "failed"
            end
        end
    end

end