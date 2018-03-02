require "httparty"
require 'json'
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
        response.ok? ? (JSON.parse(response.body)) : (raise "Error retrieving current_user")
    end

    def get_mentor_availability(mentor_id)
        response = HTTParty.get("#{@bloc_api}/mentors/#{mentor_id}/student_availability", headers: {authorization: @authenticaition_token})
        response.ok? ? (JSON.parse(response.body)) : (raise "Error retrieving mentor_availability")
    end

    def get_messages(number = 1)
        options = {
            headers: {authorization: @authenticaition_token},
            body: {page: number}    
        }

        response = HTTParty.get("#{@bloc_api}/message_threads", options)
        response.ok? ? (response) : (raise "Error retrieving messages")
    end

    def create_message(sender, recipient_id, subject, body, token = nil)
        options = {
            headers: {authorization: @authenticaition_token},
            body: {
                sender: sender,
                recipient_id: recipient_id,
                subject: subject,
                "stripped-text"=> body
            }
        }

        options[:body][:token] = token unless token == nil
        
        response = HTTParty.post("#{@bloc_api}/messages", options)
        response.ok? ? (response) : (raise "Error creating message")
    end

    def create_submission(checkpoint_id, enrollment_id, assignment_branch, assignment_commit_link, comment = "")
        options = {
            headers: {authorization: @authenticaition_token},
            body: {
                checkpoint_id: checkpoint_id,
                enrollment_id: enrollment_id,
                assignment_branch: assignment_branch,
                assignment_commit_link: assignment_commit_link,
                comment: comment
            }
        }

        response = HTTParty.post("#{@bloc_api}/checkpoint_submissions", options)
        response.ok? ? (response) : (raise "Error submitting checkpoint")
    end
end