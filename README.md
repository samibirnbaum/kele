# kele

An API Client to access Blocs API - to be packaged as a Ruby Gem

Step 1: Open talks with Blocs API

```Ruby
Kele.new(username, password)
#returns an object with methods that allow you to talk with Blocs API
```

Step 2: Call these great methods **on the returned object** to talk with Blocs API

```Ruby
.get_me
#returns current user information
```

```Ruby
.get_mentor_availability(mentor_id)
#takes in a mentor_id, this can be found in the user information returned by the get_me method
#returns the current users mentors availability
```

```Ruby
.get_roadmap(roadmap_id)
#takes in a roadmap_id, this can be found in the user information returned by the get_me method
#returns the current users roadmap information
```

```Ruby
.get_checkpoint(checkpoint_id)
#takes in a checkpoint_id, this can be found in the roadmap information returned by the get_roadmap method
#returns the current users checkpoint information
```
