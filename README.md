# Project 6 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **13** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication
- [x] User can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] User can take a photo, add a caption, and post it to "Instagram"
- [x] User can view the last 20 posts submitted to "Instagram"

The following **optional** features are implemented:

- [x] Show the username and creation time for each post
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse.
- [ ] User Profiles:
   - [ ] Allow the logged in user to add a profile photo
   - [ ] Display the profile photo with each post
   - [ ] Tapping on a post's username or profile photo goes to that user's profile page

The following **additional** features are implemented:

- [x] User can "Pull to Refresh" the main feed

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to better implement a user class 
2. Best practices to implement a comment section for each post

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/Iw0AMJG.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

My main challenge (and one that I've yet to overcome as of Friday night) is how to properly implement a user class for storing and retrieving profile information for each user, such as profile picture, an about-me section, and a list of all that user's submissions. I have an idea on how to solve this, but I just don't have enough time to get it to work properly. So for now I'm uploading this with what I have, all the required stories.

## License

    Copyright 2016 Cory Avra

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
