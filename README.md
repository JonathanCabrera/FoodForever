# FoodForever

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Allows for users to be able to find different restaurants that they would like to visit. The app also keeps track of recently visited and favorited restaurants.

### App Evaluation
- **Category:** Food / Restaurants
- **Mobile:** This app would only be available for mobile devices at this time. It is meant to be used as a fast way to locate restaurants with food options that the user would enjoy.
- **Story:** Keeps track of restaurants visited and favored, while also allowing for users to find new restaurants to try.
- **Market:** Any individual who enjoys going out to restaurants, fast food places, or just doesn’t have the energy or time to cook for themselves.
- **Habit:** This app would be used whenever a person or group of people wanted to go out to eat. They would be able to see different food options and how well the location is rated.
- **Scope:** The scope of this project includes authentication (login/logout/signup) giving users the access to a social feed where users communicate (direct 1-on-1). Users will have access to a profile page while also being able to view different restuarants.


## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previously visited and favored restaurants
* Restaurants are displayed and allow for users to favor them and/or say that they visited it
* User creates a profile with a picture and description of their food types
* Profile page archives a listed of favored and visited restaurants

**Optional Nice-to-have Stories**

* Allow for users to customize their display screens
* Post pictures from a restaurant visited and display it on a social media feed
* User are able to interact with other users by commenting on their posts

### 2. Screen Archetypes

* Login/Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person.
   * Sessions will keep track of the user’s login info until they decide to logout
* Profile Screen
   * Allows user to upload a photo and fill in information that is interesting to them and others
*  Restaurants Screen
   * Lets people change language, and app notification settings.


### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Login/ Signup page
* Restaurants
* Profile

Optional:
* Social feed
* Settings
* Restaurant creation page

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Profile -> Text field to be modified.
* Settings -> Toggle settings

## Wireframes
Assigned to: Jade Murray<br>
<img src="https://i.imgur.com/5M4Qu6i.jpg" width=200><br>
Assigned to: Jade Murray<br>
<img src="https://i.imgur.com/UDDf3Yh.jpg" width=200><br>
Assigned to: Jacob Ortiz<br>
<img src="https://i.imgur.com/Q4sV8qd.jpg" width=200><br>
Assigned to: Jonathan Cabrera<br>
<img src="https://i.imgur.com/8POnFrm.jpg" width=200><br>
Assigned to: Jose Barroso Arredondo<br>
<img src="https://i.imgur.com/AM5Lvb4.jpg" width=200><br>

### [Bonus] Interactive Prototype
<img src="http://g.recordit.co/dWuqMwLlj2.gif" width=200>

### Models

Login model 
  - company logo imageview
  - username label
  - username textfield
  - password label
  - password textfield
  - login button
  - signup button

Restarant Scrollable View Model
  - ImageView
  - Restaurant Name Label
  - Like button
  - Visited button

User Profile Model
  - user imageview
  - user name label
  - user bio label
  - logout button
 
  - recently visited restaurant section
    - each cell has..
      - Restaurant ImageView
      - Restaurant Name label
      - Restaurant Description
  - favored restaurant section
    - each cell has..
      - restaurant ImageView
      - Restaurant Name label
      - Restaurant Description
      
Create profile Model
  - add profile image button & profile image
  - display user name label
  - display username textfield
  - password label
  - password textfield
  - email label
  - email textfield
  - bio label
  - bio textfield
  - sign-up button
  
### Networking
we are using Yelp's API for businesses searches based of latitude and longitude

### Progress GIF
<img src='http://g.recordit.co/KVsjvaOifz.gif' width='' alt='Video Walkthrough' />

<img src='http://g.recordit.co/Xgpyp2djFB.gif' width='' alt='Video Walkthrough' />

<img src='http://g.recordit.co/AM8EROUVI2.gif' width='' alt='Video Walkthrough' />

### Final GIF
<img src='http://g.recordit.co/331P9y69wC.gif' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/XMd7uIe7fI.gif' width='' alt='Video Walkthrough' />







