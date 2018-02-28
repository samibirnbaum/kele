module RoadmapMethods
    def get_roadmap(roadmap_id)
        response = HTTParty.get("#{@bloc_api}/roadmaps/#{roadmap_id}", headers: {authorization: @authenticaition_token})
        response.ok? ? (response) : (raise "Error retrieving roadmap")
    end

    def get_checkpoint(checkpoint_id)
        response = HTTParty.get("#{@bloc_api}/checkpoints/#{checkpoint_id}", headers: {authorization: @authenticaition_token})
        response.ok? ? (response) : (raise "Error retrieving checkpoint")
    end
end