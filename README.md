# kele

An API Client to access Blocs API

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

```Ruby
.get_messages(number = 1)
#takes in a page number, if no number provided, default will request page 1
#returns the current users messages
```

```Ruby
.create_message(sender, recipient_id, subject, body, token = nil)
#takes in a quite a few arguments
#sender = email address of the sender
#recipient_id = id of person you are sending to, id accessible from Bloc API
#token = a string referenceing a message thread, obtain using .get_messages method. Leave blank to start new thread
#posts a message to the Bloc API
```

```Ruby
.create_submission(checkpoint_id, enrollment_id, assignment_branch, assignment_commit_link, comment = "")
#takes in a quite a few arguments
#checkpoint_id = integer accessible via get_roadmap method
#enrollment_id = integer accessible via get_me method
#assignment_branch = a string, name of assignment branch on git hub
#assignment_commit_link = a string, link to commit on git hub
#posts a checkpoint submission to the Bloc API
```

**Note:** This is not supposed to be a finished product but was part of the learning process of my web development course with Bloc covering core programming topics. Consequently. this Gem has not been published.