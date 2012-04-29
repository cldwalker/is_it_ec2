## Description
App to lookup if IP or hostname is on Amazon's EC2 infrastructure.

## Setup and Usage

Using ruby 1.9.3:

```sh
$ bundle install
# start server
$ bundle exec shotgun

# In another tab
$ curl http://localhost:9393/google.com -> NOPE
$ curl http://localhost:9393/heroku.com -> YEP
```

## Heroku Setup

```sh
$ heroku create -s cedar
# for analytics
$ heroku config:add GA_CODE=YOUR_CODE

## Credits
* @hundredwatt for [the gist](https://gist.github.com/2464999) that kicked this off

## TODO

Would be fun to turn these responses into something more funny with a specific theme. For example,
we could equate EC2 to Terminator's skynet (you do know that EC2 had a major outage on the day that
skynet became active, right? ). A YEP could be [a happy
terminator](http://media.giantbomb.com/uploads/2/28503/1080145-happy_terminator_super.jpg) and a
NOPE could be a [dead serious
one](http://images.wikia.com/terminator/images/1/19/Terminator_robot.jpg). I'm also open to better
ideas.
