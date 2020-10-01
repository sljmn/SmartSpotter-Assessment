# How to use this api?
See below short documentation how to setup and use this api. The api is live and deployed on heroku: https://evilcorp-api.herokuapp.com/

## Signup
Before you can use this API you need to signup, using your @evil-corp.com email address. Other @domains.tld wont work.
Send a POST request to https://evilcorp-api.herokuapp.com/signup  
All request should be in JSON format.

```
{
"user" : {
"name": "John Doe",
"email":  "johndoe@evil-corp.com",
"password": "foo",
"password_confirmation": "foo"

}}
```

Response will be something like:
```
{
  "message": "Account created successfully",
  "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE2MDE1NzMxMzd9.7r4xvkiTdIzsldNn6oyy6Sj-zSPj23f7J1LN3Bl0CE4"
}
```
You can use the auth_token to make other requests.  

## Login

POST https://evilcorp-api.herokuapp.com//auth/login

If you already created your account, you can login using your chosen email and password. After login an auth_token will be returned, which you need to use to authenticate your requests

```
{
"user" : {
"email":  "johndoe@evil-corp.com",
"password": "foo"
}}
```
Response will be an auth_token, which is needed to make other requests


### Get rooms
GET https://evilcorp-api.herokuapp.com/api/v1/rooms
(dont forget to include your auth_token in the authentication)


### Get all bookings (this will return all the bookings in the database, not only yours)
GET https://evilcorp-api.herokuapp.com/api/v1/bookings


### Make a booking
POST  https://evilcorp-api.herokuapp.com/api/v1/rooms/:id/bookings
Where :id is the ID of the room you want to book.
Body to send with your request should include:
```
{
   "start_time": "20:20",
   "end_time": "20:25",
   "date": "2020-09-25 08:52:21"

  }
  ```

  This will create a new booking in our database
```
  #<Booking id: 184, date: "2020-09-25", room_id: 1, user_id: 5, created_at: "2020-09-30 17:40:15", updated_at: "2020-09-30 17:40:15", start_time: "2020-09-30 18:20:00", end_time: "2020-09-30 18:25:00">
```
If the desired date isn't available, an error message will be returned. The scope of the booking is data and room. So if the timeslot of your booking isnt available, try a different date or room.

```
{
  "start_time": [
    "overlaps with another record"
  ]
}
```

Furthermore, your booking must include the date, start_time, end_time. Without any of these params, booking wont be created.

### Delete your booking
DELETE https://evilcorp-api.herokuapp.com/api/v1/rooms/:id/bookings/:id


### Update your booking


PUT https://evilcorp-api.herokuapp.com/api/v1/rooms/:id/bookings/:id

Include this JSON in the request of your body
```
{
   "start_time": "20:22",
   "end_time": "20:25",
   "date": "2020-09-25 08:52:21"
}
  ```

### See all bookings

GET https://evilcorp-api.herokuapp.com/api/v1/bookings

### Invite other users to your booking
POST https://evilcorp-api.herokuapp.com/api/v1/bookings/:id/participants
Invitee_id is the ID of the user you want to invite to your booking. invitee_id must exist otherwise you cant invite them.
```
{ "invitee_id": "5" }
```

#### See all participants in a booking
GET https://evilcorp-api.herokuapp.com/api/v1/bookings/:id/participants


# Context

Evil Corp is a growing company, and has a lovely office in Amsterdam.
As teams are expanding, we sometimes want to use the same meeting rooms for different teams.
In this phase of our transformation into a big evil corporate, we now need a meeting rooms booking application.

# Goal

You'll cover some basics about API design and TDD.
As such, you'll mainly focus on the backend of the application.
Others will build apps later, using your API as backbone.

The following user stories describe what should be possible to do through this API:

- A visitor can sign up (only with an "@evil-corp.com" e-mail address though)
- A user can book a room, without conflicting times and dates. So you can't book an occupied room.
- A user can update their own booking
- A user can cancel their own booking
- A user can view all of the bookings
- A user can invite other users to the booking

# Skeleton

We bootstrapped a skeleton for you. We covered the authentication part for you and setup some models, controllers, tests and routes. It's up to you to find out where you should continue. Try to test at least one request and one function. Nowadays we don't really test controller actions anymore but mostly the request.

## Tooling

- You must use **RSpec** for TDD (focus on acceptance and integration tests)
- You can use **Postman** to test out your API (we **strongly** advice you to use this tool)
- You can use any convenient gems you may need
- Your code must be available on **GitHub / Gitlab**
- The API must be deployed on **Heroku** (Bonus points)

## Timeline

Our employees are expecting to be able to use this app in 1 week. Move fast!

## Questions

Please contact us if you have any questions. There is no right or wrong question and we rather help you than have you get stuck for hours. Feel free to contact Martijn: martijn@smartspotter.com

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing Ruby (with [rbenv](https://github.com/sstephenson/rbenv))

Run this command, this might take **a few minutes**

```
rbenv install 2.5.5
```

Once the ruby installation is done, run this command to tell the system
to use the 2.5.5 version by default.

```
rbenv global 2.5.5
```

### Installing Postgresql

Let's install Postgresql, an open-source robust and production-ready database.

```
brew install postgresql
brew services start postgresql
```

### Installing Rails

Run the following command to install Rails version 5.2.3

```
gem install rails -v 5.2.3
```

### Setup Project

Clone git repository using the following command:

```
git clone https://github.com/SmartSpotter/SmartSpotter-Assessment.git
cd SmartSpotter-Assessment
```

Install all dependencies.

```
bundle install
```

Create db and migrate schema.

```
rails db:create
rails db:migrate
rails db:seed
```

Now run the application.

```
rails s
```

Run tests

```
rspec . -fd
```
